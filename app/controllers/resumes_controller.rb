class ResumesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]
  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.all 
    @instruments = Instrument.all


    if !params[:instruments].blank?
      instruments = params[:instruments]
      @resumes=@resumes.where(:instrumentalist_id => Instrumentalist.where(:instrument_id => instruments).pluck(:id))
    end


    if !params[:country_id].blank?
      country=params[:country_id]
      @resumes = @resumes.where(:instrumentalist_id => Instrumentalist.where(:user_id => User.where(country_id: country).pluck(:id)).pluck(:id))
    end

    if !params[:state_id].blank?
      state=params[:state_id]
      @resumes = @resumes.where(:instrumentalist_id => Instrumentalist.where(:user_id => User.where(state_id: state).pluck(:id)).pluck(:id))
    end

    if !params[:city_name].blank?
      city=params[:city_id]
      @resumes= @resumes.where(:instrumentalist_id => Instrumentalist.where(:user_id => User.where(city_id: city).pluck(:id)).pluck(:id))
    end
    @resumes= @resumes.paginate(:page => params[:page], :per_page =>10)
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    @instrumentalist= Instrumentalist.find(@resume.instrumentalist_id)
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
    @instrumentalists= Instrumentalist.where(user_id: current_user.id)
  end

  # GET /resumes/1/edit
  def edit
    if @user.id==current_user.id
      @instrumentalists= Instrumentalist.where(user_id: current_user.id)
    else 
      redirect_to :back
    end
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(resume_params)
    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    if @user.id==current_user.id
      respond_to do |format|
        if @resume.update(resume_params)
          format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
          format.json { render :show, status: :ok, location: @resume }
        else
          format.html { render :edit }
          format.json { render json: @resume.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    if @user.id==current_user.id
      @resume.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Resume was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end
    
    def set_user
      @user=User.find(Instrumentalist.find(@resume.instrumentalist_id).user_id)
    end
      
    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:instrumentalist_id, genre_ids: [])
    end
end
