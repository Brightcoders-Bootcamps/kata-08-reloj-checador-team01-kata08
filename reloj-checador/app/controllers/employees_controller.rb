class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees or /employees.json
  def index
    @employees = Employee.all.order(created_at: :desc).group("employees.company_id, id").paginate(page: params[:page], per_page: 15)
    @companies = Company.where(id: @employees.pluck(:company_id).uniq.sort)
  end

  # GET /employees/1 or /employees/1.json
  def show
    @list_attendaces = Employee.select("A.id, A.date, A.time, A.check_type")
                               .joins("JOIN attendaces A ON employees.private_number = A.private_number")
                               .where(private_number: @employee.private_number)
                               .order("A.id DESC")
                               .paginate(page: params[:page], per_page: 15)
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit; end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee was successfully created."
      redirect_to employees_url
    else
      flash[:error] = @employee.errors.full_messages.join(" and ")
      redirect_to new_employee_url(@employee)
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    if @employee.update(employee_params)
      flash[:success] = "Employee was successfully updated."
      redirect_to employee_url(@employee)
    else
      flash[:error] = @employee.errors.full_messages.join(" and ")
      render 'edit'
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.active = false
    if @employee.save
      flash[:success] = "Employee was successfully inactivated."
    else
      flash[:error] = @employee.errors.full_messages
    end
    redirect_to employees_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id]) rescue nil
    employees_redirection if @employee.nil?
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(:email, :name, :lastname, :position, :private_number, :active, :company_id)
  end

  def employees_redirection
    flash[:error] = 'Employee does not exist'
    redirect_to employees_url
  end
end
