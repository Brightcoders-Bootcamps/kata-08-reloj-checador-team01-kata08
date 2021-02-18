class AttendacesController < CheckinsController
  before_action :set_attendace, only: %i[ show edit update destroy ]
  before_action :redirect_to_new, except: [:new, :create]
  # GET /attendaces or /attendaces.json
  def index
    @attendaces = Employee.select("A.id, employees.name, employees.lastname, employees.position, A.date, A.time, A.check_type").
    joins("JOIN attendaces A ON employees.private_number = A.private_number")

    @attendaces_total = @attendaces.length
  end

  # GET /attendaces/1 or /attendaces/1.json
  def show
  end

  # GET /attendaces/new
  def new
    @attendace = Attendace.new
  end

  # GET /attendaces/1/edit
  def edit
  end

  # POST /attendaces or /attendaces.json
  def create
    @attendace = Attendace.new(attendace_params)
    employee = Employee.find_by(private_number: attendace_params[:private_number])
    if !employee.nil?
      if @attendace.save
        flash[:success] = "Employee #{employee.name} #{@attendace.check_type} registered"
        redirect_to new_attendace_path
      else
        flash[:error] = @attendace.errors.full_messages
        render "new"
      end
    else
      flash[:error] = "Private number not found"
      render "new"
    end
  end

  # PATCH/PUT /attendaces/1 or /attendaces/1.json
  def update
    if @attendace.update(attendace_params)
      flash[:success] = "Attendace was successfully updated."
      redirect_to @attendaces_path
    else
      flash[:error] = @attendace.errors.full_messages
      render @attendaces_path
    end
  end

  # DELETE /attendaces/1 or /attendaces/1.json
  def destroy
    if @attendace.destroy
      flash[:success] = "Record deleted"
      render "index"
    else
      flash[:error] = @attendace.errors.full_messages
      render "index"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendace
    @attendace = Attendace.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendace_params
    params.require(:attendace).permit(:private_number, :date, :time)
  end

  def redirect_to_new
    if !admin_signed_in?
      redirect_to new_attendace_path
    end
  end
end