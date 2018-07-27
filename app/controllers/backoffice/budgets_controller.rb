class Backoffice::BudgetsController < ApplicationController
  before_action :set_backoffice_budget, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/budgets
  # GET /backoffice/budgets.json
  def index
    @backoffice_budgets = Backoffice::Budget.all
  end

  # GET /backoffice/budgets/1
  # GET /backoffice/budgets/1.json
  def show
  end

  # GET /backoffice/budgets/new
  def new
    @backoffice_budget = Backoffice::Budget.new
  end

  # GET /backoffice/budgets/1/edit
  def edit
  end

  # POST /backoffice/budgets
  # POST /backoffice/budgets.json
  def create
    @backoffice_budget = Backoffice::Budget.new(backoffice_budget_params)

    respond_to do |format|
      if @backoffice_budget.save
        format.html { redirect_to @backoffice_budget, notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_budget }
      else
        format.html { render :new }
        format.json { render json: @backoffice_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/budgets/1
  # PATCH/PUT /backoffice/budgets/1.json
  def update
    respond_to do |format|
      if @backoffice_budget.update(backoffice_budget_params)
        format.html { redirect_to @backoffice_budget, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_budget }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/budgets/1
  # DELETE /backoffice/budgets/1.json
  def destroy
    @backoffice_budget.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_budgets_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backoffice_budget
      @backoffice_budget = Backoffice::Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backoffice_budget_params
      params.require(:backoffice_budget).permit(:kind, :note, :date, :expiration_date, :total_value, :state, :person_id)
    end
end
