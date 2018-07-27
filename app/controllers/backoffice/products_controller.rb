class Backoffice::ProductsController < ApplicationController
  before_action :set_backoffice_product, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/products
  # GET /backoffice/products.json
  def index
    @backoffice_products = Backoffice::Product.all
  end

  # GET /backoffice/products/1
  # GET /backoffice/products/1.json
  def show
  end

  # GET /backoffice/products/new
  def new
    @backoffice_product = Backoffice::Product.new
  end

  # GET /backoffice/products/1/edit
  def edit
  end

  # POST /backoffice/products
  # POST /backoffice/products.json
  def create
    @backoffice_product = Backoffice::Product.new(backoffice_product_params)

    respond_to do |format|
      if @backoffice_product.save
        format.html { redirect_to @backoffice_product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_product }
      else
        format.html { render :new }
        format.json { render json: @backoffice_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/products/1
  # PATCH/PUT /backoffice/products/1.json
  def update
    respond_to do |format|
      if @backoffice_product.update(backoffice_product_params)
        format.html { redirect_to @backoffice_product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_product }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/products/1
  # DELETE /backoffice/products/1.json
  def destroy
    @backoffice_product.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backoffice_product
      @backoffice_product = Backoffice::Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backoffice_product_params
      params.require(:backoffice_product).permit(:product_code, :description, :purchase_price, :sale_price, :profit_margin, :stock, :stock_reserved, :category_id)
    end
end
