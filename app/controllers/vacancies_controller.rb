class VacanciesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vacancy, only: [:show, :edit, :update, :destroy]

  # GET /vacancies
  # GET /vacancies.json
  def index
    @vacancies = Vacancy.all
    @instruments = Instrument.all
    @genres = Genre.all

    if !params[:genres].blank?
      genres = params[:genres]
      @vacancies=Vacancy.where(group_id: GroupToGenre.where(:genre_id=> genres).pluck(:group_id))
    end

    if !params[:instruments].blank?
      instruments = params[:instruments]
      @vacancies=@vacancies.where(:instrument_id =>instruments)
    end


    if !params[:country_id].blank?
      country=params[:country_id]
      @vacancies = @vacancies.where(group_id: Group.where(:country_id=> country).pluck(:id))
    end

    if !params[:state_id].blank?
      state=params[:state_id]
      @vacancies = @vacancies.where(group_id: Group.where(:state_id=> state).pluck(:id))
    end

    if !params[:city_id].blank?
      city=params[:city_id]
      @vacancies= @vacancies.where(group_id: Group.where(:city_id=> city).pluck(:id))
    end
    if !params[:genres].blank?
      genres = params[:genres]
      @vacancies=@vacancies.where(group_id: GroupToGenre.where(:genre_id=> genres).pluck(:group_id))
    end

   @vacancies= @vacancies.paginate(:page => params[:page], :per_page =>10)
  end

  # GET /vacancies/1
  # GET /vacancies/1.json
  def show
    @answer=Answer.where(vacancy_id: @vacancy.id, user_id: current_user.id).take
    if @answer==nil
      @answer=Answer.new
    end
  end

  # GET /vacancies/new
  def new
    @vacancy = Vacancy.new  
    if ( params[:group_id]!=nil) 
      @group =  Group.find(params[:group_id])
    end
    @instruments = Instrument.all
  end

 

  # GET /vacancies/1/edit
  def edit 
     @instruments = Instrument.all
  end

  # POST /vacancies
  # POST /vacancies.json
  def create
    @vacancy = Vacancy.new(vacancy_params)
    if ( params[:group_id]!=nil) 
      @vacancy.group_id=params[:group_id]
    end
    respond_to do |format|
      if @vacancy.save
        format.html { redirect_to @vacancy, notice: 'Vacancy was successfully created.' }
        format.json { render :show, status: :created, location: @vacancy }
      else
        format.html { render :new }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacancies/1
  # PATCH/PUT /vacancies/1.json
  def update
    respond_to do |format|
      if @vacancy.update(vacancy_params)
        format.html { redirect_to @vacancy, notice: 'Vacancy was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacancy }
      else
        format.html { render :edit }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancies/1
  # DELETE /vacancies/1.json
  def destroy
    @vacancy.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Vacancy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacancy_params
      params.require(:vacancy).permit(:instrument_id,:group_id, :info)  
    end
end
