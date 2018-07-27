class Backoffice::AccountsPayablesController < ApplicationController
  before_action :set_backoffice_accounts_payable, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/accounts_payables
  # GET /backoffice/accounts_payables.json
  def index
    @backoffice_accounts_payables = Backoffice::AccountsPayable.all
  end

  # GET /backoffice/accounts_payables/1
  # GET /backoffice/accounts_payables/1.json
  def show
  end

  # GET /backoffice/accounts_payables/new
  def new
    @backoffice_accounts_payable = Backoffice::AccountsPayable.new
  end

  # GET /backoffice/accounts_payables/1/edit
  def edit
  end

  # POST /backoffice/accounts_payables
  # POST /backoffice/accounts_payables.json
  def create
    @backoffice_accounts_payable = Backoffice::AccountsPayable.new(backoffice_accounts_payable_params)

    respond_to do |format|
      if @backoffice_accounts_payable.save
        format.html { redirect_to @backoffice_accounts_payable, notice: 'Accounts payable was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_accounts_payable }
      else
        format.html { render :new }
        format.json { render json: @backoffice_accounts_payable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/accounts_payables/1
  # PATCH/PUT /backoffice/accounts_payables/1.json
  def update
    respond_to do |format|
      if @backoffice_accounts_payable.update(backoffice_accounts_payable_params)
        format.html { redirect_to @backoffice_accounts_payable, notice: 'Accounts payable was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_accounts_payable }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_accounts_payable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/accounts_payables/1
  # DELETE /backoffice/accounts_payables/1.json
  def destroy
    @backoffice_accounts_payable.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_accounts_payables_url, notice: 'Accounts payable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backoffice_accounts_payable
      @backoffice_accounts_payable = Backoffice::AccountsPayable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backoffice_accounts_payable_params
      params.require(:backoffice_accounts_payable).permit(:state, :description, :document_kind, :document_number, :issue_date, :expiration_date, :payment_date, :total_parcels, :current_parcel, :payable_value, :additions_value, :discount_value, :total_value, :paid_value, :voucher_image, :purchase_id, :system_user, :references)
    end
end
