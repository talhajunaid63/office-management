class ExpensesController < ApplicationController
  before_action :set_current_company
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.company = @company

    respond_to do |format|
      if @expense.save
        format.html { redirect_to company_expense_url(@company, @expense), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to company_expense_url(@company, @expense), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html do
        redirect_to company_expenses_url(@company, @expense), notice: 'Expense was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_current_company
    @company = Company.find(params[:company_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = @company.expenses.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:expense_type, :comments, :amount, :date)
  end
end
