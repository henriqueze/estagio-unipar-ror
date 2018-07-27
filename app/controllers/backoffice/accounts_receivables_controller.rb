class Backoffice::AccountsReceivablesController < ApplicationController
  before_action :set_backoffice_accounts_receivable, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/accounts_receivables
  # GET /backoffice/accounts_receivables.json
  def index
    @backoffice_accounts_receivables = Backoffice::AccountsReceivable.all
  end

  # GET /backoffice/accounts_receivables/1
  # GET /backoffice/accounts_receivables/1.json
  def show
  end

  # GET /backoffice/accounts_receivables/new
  def new
    @backoffice_accounts_receivable = Backoffice::AccountsReceivable.new
  end

  # GET /backoffice/accounts_receivables/1/edit
  def edit
  end

  # POST /backoffice/accounts_receivables
  # POST /backoffice/accounts_receivables.json
  def create
    @backoffice_accounts_receivable = Backoffice::AccountsReceivable.new(backoffice_accounts_receivable_params)

    respond_to do |format|
      if @backoffice_accounts_receivable.save
        format.html { redirect_to @backoffice_accounts_receivable, notice: 'Accounts receivable was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_accounts_receivable }
      else
        format.html { render :new }
        format.json { render json: @backoffice_accounts_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/accounts_receivables/1
  # PATCH/PUT /backoffice/accounts_receivables/1.json
  def update
    respond_to do |format|
      if @backoffice_accounts_receivable.update(backoffice_accounts_receivable_params)
        format.html { redirect_to @backoffice_accounts_receivable, notice: 'Accounts receivable was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_accounts_receivable }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_accounts_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/accounts_receivables/1
  # DELETE /backoffice/accounts_receivables/1.json
  def destroy
    @backoffice_accounts_receivable.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_accounts_receivables_url, notice: 'Accounts receivable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backoffice_accounts_receivable
      @backoffice_accounts_receivable = Backoffice::AccountsReceivable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backoffice_accounts_receivable_params
      params.require(:backoffice_accounts_receivable).permit(:state, :description, :kind, :issue_date, :expiration_date, :received_date, :total_value, :received_value, :remaining_value, :total_parcels, :parcel, :sales_id, :payment_type_id, :system_user_id)
    end
end
