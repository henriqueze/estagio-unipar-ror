class AccountsReceivablesController < ApplicationController
  before_action :set_accounts_receivable, only: [:show, :edit, :update, :destroy]

  # GET /accounts_receivables
  # GET /accounts_receivables.json
  def index
    @accounts_receivables = AccountsReceivable.all
  end

  # GET /accounts_receivables/1
  # GET /accounts_receivables/1.json
  def show
  end

  # GET /accounts_receivables/new
  def new
    @accounts_receivable = AccountsReceivable.new
  end

  # GET /accounts_receivables/1/edit
  def edit
  end

  # POST /accounts_receivables
  # POST /accounts_receivables.json
  def create
    @accounts_receivable = AccountsReceivable.new(accounts_receivable_params)

    respond_to do |format|
      if @accounts_receivable.save
        format.html { redirect_to @accounts_receivable, notice: 'Accounts receivable was successfully created.' }
        format.json { render :show, status: :created, location: @accounts_receivable }
      else
        format.html { render :new }
        format.json { render json: @accounts_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts_receivables/1
  # PATCH/PUT /accounts_receivables/1.json
  def update
    respond_to do |format|
      if @accounts_receivable.update(accounts_receivable_params)
        format.html { redirect_to @accounts_receivable, notice: 'Accounts receivable was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounts_receivable }
      else
        format.html { render :edit }
        format.json { render json: @accounts_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts_receivables/1
  # DELETE /accounts_receivables/1.json
  def destroy
    @accounts_receivable.destroy
    respond_to do |format|
      format.html { redirect_to accounts_receivables_url, notice: 'Accounts receivable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounts_receivable
      @accounts_receivable = AccountsReceivable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounts_receivable_params
      params.require(:accounts_receivable).permit(:state, :description, :kind, :issue_date, :expiration_date, :received_date, :total_value, :received_value, :remaining_value, :total_parcels, :parcel, :sales_id, :payment_type_id, :system_user_id)
    end
end
