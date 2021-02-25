class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  # GET /companies or /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1 or /companies/1.json
  def show; end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit; end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Company was successfully created."
      redirect_to companies_url
    else
      flash[:error] = @company.errors.full_messages.join(" and ")
      redirect_to new_company_url(@company)
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    if @company.update(company_params)
      flash[:success] = "Company was successfully updated."
      redirect_to company_url(@company)
    else
      flash[:error] = @company.errors.full_messages.join(" and ")
      render "edit"
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    if @company.employees.count == 0
      if @company.destroy
        flash[:success] = "Company was successfully destroyed."
      else
        flash[:error] = @company.errors.full_messages.join(" and ")
      end
    else
      flash[:error] = "Company has existing employees asociated"
    end
    redirect_to companies_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id]) rescue nil
    companies_redirection if @company.nil?
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name, :address)
  end

  def companies_redirection
    flash[:error] = 'Company is not exist'
    redirect_to companies_url
  end
end
