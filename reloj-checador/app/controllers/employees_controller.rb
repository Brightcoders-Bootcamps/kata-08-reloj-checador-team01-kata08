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
                               .order("A.date DESC")
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

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.active = false
    if @employee.save
     flash[:success] = "Employee was successfully inactivated."
     redirect_to employees_url
    else
     flash[:error] = @employee.errors.full_messages
     redirect_to employees_url
    end  
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:email, :name, :lastname, :position, :private_number, :active, :company_id)
    end
end
