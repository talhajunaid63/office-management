# frozen_string_literal: true

class SalariesController < ApplicationController
  before_action :set_current_company
  before_action :set_salary, only: %i[show edit update destroy]

  # GET /salaries or /salaries.json
  def index
    @salaries = @company.salaries
  end

  # GET /salaries/1 or /salaries/1.json
  def show; end

  # GET /salaries/new
  def new
    @salary = Salary.new
  end

  # GET /salaries/1/edit
  def edit; end

  # POST /salaries or /salaries.json
  def create
    @salary = Salary.new(salary_params)
    @salary.company = @company

    respond_to do |format|
      if @salary.save
        format.html { redirect_to company_salary_url(@company, @salary), notice: 'Salary was successfully created.' }
        format.json { render :show, status: :created, location: @salary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salaries/1 or /salaries/1.json
  def update
    respond_to do |format|
      if @salary.update(salary_params)
        format.html { redirect_to company_salary_url(@company, @salary), notice: 'Salary was successfully updated.' }
        format.json { render :show, status: :ok, location: @salary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salaries/1 or /salaries/1.json
  def destroy
    @salary.destroy

    respond_to do |format|
      format.html { redirect_to company_salaries_url(@company), notice: 'Salary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_current_company
    @company = Company.find(params[:company_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_salary
    @salary = @company.salaries.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def salary_params
    params.require(:salary).permit(:user_id, :bonus, :gross_total, :month)
  end
end
