class Backoffice::SalesController < ApplicationController
  before_action :set_backoffice_sale, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/sales
  # GET /backoffice/sales.json
  def index
    @backoffice_sales = Backoffice::Sale.all
  end

  # GET /backoffice/sales/1
  # GET /backoffice/sales/1.json
  def show
  end

  # GET /backoffice/sales/new
  def new
    @backoffice_sale = Backoffice::Sale.new
  end

  # GET /backoffice/sales/1/edit
  def edit
  end

  # POST /backoffice/sales
  # POST /backoffice/sales.json
  def create
    @backoffice_sale = Backoffice::Sale.new(backoffice_sale_params)

    respond_to do |format|
      if @backoffice_sale.save
        format.html { redirect_to @backoffice_sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_sale }
      else
        format.html { render :new }
        format.json { render json: @backoffice_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/sales/1
  # PATCH/PUT /backoffice/sales/1.json
  def update
    respond_to do |format|
      if @backoffice_sale.update(backoffice_sale_params)
        format.html { redirect_to @backoffice_sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_sale }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/sales/1
  # DELETE /backoffice/sales/1.json
  def destroy
    @backoffice_sale.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backoffice_sale
      @backoffice_sale = Backoffice::Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backoffice_sale_params
      params.require(:backoffice_sale).permit(:date, :total_value, :discount_value, :state, :person_id)
    end
end
