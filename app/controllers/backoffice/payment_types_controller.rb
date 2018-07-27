class Backoffice::PaymentTypesController < ApplicationController
  before_action :set_backoffice_payment_type, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/payment_types
  # GET /backoffice/payment_types.json
  def index
    @backoffice_payment_types = Backoffice::PaymentType.all
  end

  # GET /backoffice/payment_types/1
  # GET /backoffice/payment_types/1.json
  def show
  end

  # GET /backoffice/payment_types/new
  def new
    @backoffice_payment_type = Backoffice::PaymentType.new
  end

  # GET /backoffice/payment_types/1/edit
  def edit
  end

  # POST /backoffice/payment_types
  # POST /backoffice/payment_types.json
  def create
    @backoffice_payment_type = Backoffice::PaymentType.new(backoffice_payment_type_params)

    respond_to do |format|
      if @backoffice_payment_type.save
        format.html { redirect_to @backoffice_payment_type, notice: 'Payment type was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_payment_type }
      else
        format.html { render :new }
        format.json { render json: @backoffice_payment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/payment_types/1
  # PATCH/PUT /backoffice/payment_types/1.json
  def update
    respond_to do |format|
      if @backoffice_payment_type.update(backoffice_payment_type_params)
        format.html { redirect_to @backoffice_payment_type, notice: 'Payment type was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_payment_type }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_payment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/payment_types/1
  # DELETE /backoffice/payment_types/1.json
  def destroy
    @backoffice_payment_type.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_payment_types_url, notice: 'Payment type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backoffice_payment_type
      @backoffice_payment_type = Backoffice::PaymentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backoffice_payment_type_params
      params.require(:backoffice_payment_type).permit(:kind, :description, :interest_rates, :max_parcel)
    end
end
