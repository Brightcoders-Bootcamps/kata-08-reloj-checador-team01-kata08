class AttendacesController < ApplicationController
  before_action :set_attendace, only: %i[ show edit update destroy ]

  # GET /attendaces or /attendaces.json
  def index
    @attendaces = Attendace.all
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
    tim = Time.new
    @attendace.date = tim.strftime("%Y-%m-%d")
    @attendace.time = tim.strftime("%I:%M:%S")

    respond_to do |format|
      if @attendace.save
        format.html { redirect_to @attendace, notice: "Attendace was successfully created." }
        format.json { render :show, status: :created, location: @attendace }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendaces/1 or /attendaces/1.json
  def update
    respond_to do |format|
      if @attendace.update(attendace_params)
        format.html { redirect_to @attendace, notice: "Attendace was successfully updated." }
        format.json { render :show, status: :ok, location: @attendace }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendaces/1 or /attendaces/1.json
  def destroy
    @attendace.destroy
    respond_to do |format|
      format.html { redirect_to attendaces_url, notice: "Attendace was successfully destroyed." }
      format.json { head :no_content }
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
end
