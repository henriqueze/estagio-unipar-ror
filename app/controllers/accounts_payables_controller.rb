class AccountsPayablesController < ApplicationController
  before_action :set_accounts_payable, only: [:show, :edit, :update, :destroy]

  # GET /accounts_payables
  # GET /accounts_payables.json
  def index
    @accounts_payables = AccountsPayable.all
  end

  # GET /accounts_payables/1
  # GET /accounts_payables/1.json
  def show
  end

  # GET /accounts_payables/new
  def new
    @accounts_payable = AccountsPayable.new
  end

  # GET /accounts_payables/1/edit
  def edit
  end

  # POST /accounts_payables
  # POST /accounts_payables.json
  def create
    @accounts_payable = AccountsPayable.new(accounts_payable_params)

    respond_to do |format|
      if @accounts_payable.save
        format.html { redirect_to @accounts_payable, notice: 'Accounts payable was successfully created.' }
        format.json { render :show, status: :created, location: @accounts_payable }
      else
        format.html { render :new }
        format.json { render json: @accounts_payable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts_payables/1
  # PATCH/PUT /accounts_payables/1.json
  def update
    respond_to do |format|
      if @accounts_payable.update(accounts_payable_params)
        format.html { redirect_to @accounts_payable, notice: 'Accounts payable was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounts_payable }
      else
        format.html { render :edit }
        format.json { render json: @accounts_payable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts_payables/1
  # DELETE /accounts_payables/1.json
  def destroy
    @accounts_payable.destroy
    respond_to do |format|
      format.html { redirect_to accounts_payables_url, notice: 'Accounts payable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounts_payable
      @accounts_payable = AccountsPayable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounts_payable_params
      params.require(:accounts_payable).permit(:state, :description, :document_kind, :document_number, :issue_date, :expiration_date, :payment_date, :total_parcels, :current_parcel, :payable_value, :additions_value, :discount_value, :total_value, :paid_value, :voucher_image, :purchase_id, :system_user_id)
    end
end
