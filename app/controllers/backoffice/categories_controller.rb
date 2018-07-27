class Backoffice::CategoriesController < ApplicationController
  before_action :set_backoffice_category, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/categories
  # GET /backoffice/categories.json
  def index
    @backoffice_categories = Backoffice::Category.all
  end

  # GET /backoffice/categories/1
  # GET /backoffice/categories/1.json
  def show
  end

  # GET /backoffice/categories/new
  def new
    @backoffice_category = Backoffice::Category.new
  end

  # GET /backoffice/categories/1/edit
  def edit
  end

  # POST /backoffice/categories
  # POST /backoffice/categories.json
  def create
    @backoffice_category = Backoffice::Category.new(backoffice_category_params)

    respond_to do |format|
      if @backoffice_category.save
        format.html { redirect_to @backoffice_category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_category }
      else
        format.html { render :new }
        format.json { render json: @backoffice_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/categories/1
  # PATCH/PUT /backoffice/categories/1.json
  def update
    respond_to do |format|
      if @backoffice_category.update(backoffice_category_params)
        format.html { redirect_to @backoffice_category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_category }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/categories/1
  # DELETE /backoffice/categories/1.json
  def destroy
    @backoffice_category.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backoffice_category
      @backoffice_category = Backoffice::Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backoffice_category_params
      params.require(:backoffice_category).permit(:description)
    end
end
