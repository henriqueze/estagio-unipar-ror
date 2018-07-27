class Backoffice::PeopleController < ApplicationController
  before_action :set_backoffice_person, only: [:show, :edit, :update, :destroy]

  # GET /backoffice/people
  # GET /backoffice/people.json
  def index
    @backoffice_people = Backoffice::Person.all
  end

  # GET /backoffice/people/1
  # GET /backoffice/people/1.json
  def show
  end

  # GET /backoffice/people/new
  def new
    @backoffice_person = Backoffice::Person.new
  end

  # GET /backoffice/people/1/edit
  def edit
  end

  # POST /backoffice/people
  # POST /backoffice/people.json
  def create
    @backoffice_person = Backoffice::Person.new(backoffice_person_params)

    respond_to do |format|
      if @backoffice_person.save
        format.html { redirect_to @backoffice_person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @backoffice_person }
      else
        format.html { render :new }
        format.json { render json: @backoffice_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backoffice/people/1
  # PATCH/PUT /backoffice/people/1.json
  def update
    respond_to do |format|
      if @backoffice_person.update(backoffice_person_params)
        format.html { redirect_to @backoffice_person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @backoffice_person }
      else
        format.html { render :edit }
        format.json { render json: @backoffice_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backoffice/people/1
  # DELETE /backoffice/people/1.json
  def destroy
    @backoffice_person.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backoffice_person
      @backoffice_person = Backoffice::Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backoffice_person_params
      params.require(:backoffice_person).permit(:kind, :name, :company_name, :person_rg, :personC_ie, :person_cpf, :personC_cnpj, :personC_provider, :address, :address_number, :address_complement, :address_bairro, :address_zip, :address_city, :address_state, :person_tel1, :person_tel2, :person_email, :person_obs)
    end
end
