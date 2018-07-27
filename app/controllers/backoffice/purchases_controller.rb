class Backoffice::PurchasesController < ApplicationController
  before_action :set_backoffice_purchase, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/purchases
  # GET /backoffice/purchases.json
  def index
    @backoffice_purchases = Backoffice::Purchase.all
  end

  # GET /backoffice/purchases/1
  # GET /backoffice/purchases/1.json
  def show
  end

  # GET /backoffice/purchases/new
  def new
    @backoffice_purchase = Backoffice::Purchase.new
  end

  # GET /backoffice/purchases/1/edit
  def edit
  end

  # POST /backoffice/purchases
  # POST /backoffice/purchases.json
  def create
    @backoffice_purchase = Backoffice::Purchase.new(backoffice_purchase_params)

    respond_to do |format|
      if @backoffice_purchase.save
        format.html { redirect_to @backoffice_purchase, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_purchase }
      else
        format.html { render :new }
        format.json { render json: @backoffice_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/purchases/1
  # PATCH/PUT /backoffice/purchases/1.json
  def update
    respond_to do |format|
      if @backoffice_purchase.update(backoffice_purchase_params)
        format.html { redirect_to @backoffice_purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_purchase }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/purchases/1
  # DELETE /backoffice/purchases/1.json
  def destroy
    @backoffice_purchase.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backoffice_purchase
      @backoffice_purchase = Backoffice::Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backoffice_purchase_params
      params.require(:backoffice_purchase).permit(:date, :total_value, :freight_value, :person_id)
    end
end
