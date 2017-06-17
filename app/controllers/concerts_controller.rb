class ConcertsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_concert, only: [:show, :edit, :update, :destroy]

  # GET /concerts
  # GET /concerts.json
  def index
   @concerts = Concert.all
   @genres = Genre.all


  if !params[:genres].blank?
    genres = params[:genres]
    @concerts=Concert.find(ConcertParticipant.where(:group_id=> GroupToGenre.where(:genre_id=> genres).pluck(:group_id)).pluck(:concert_id))
  end

   if !params[:name].blank?
   @concerts=params[:name]
   @concerts=@concerts.where("name like :name ",name: "%#{@name}%")
  end
 if !params[:country_name].blank?
    country=params[:country_name]
    @concerts = @concerts.where(:country=> country)
  end

 if !params[:state_name].blank?
    state=params[:state_name]
    @concerts = @concerts.where(:state => state)
  end

 if !params[:city_name].blank?
    city=params[:city_name]
    @concerts= @concerts.where(:city => city)
  end
 end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
   @concert_participant=ConcertParticipant.new
   @concert_note=ConcertNote.new
   @concert_follower=ConcertFollower.where(concert_id: @concert.id, user_id: current_user.id).take
   if @concert_follower==nil
     @concert_follower=ConcertFollower.new
   end
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts
  # POST /concerts.json
  def create
    @concert = Concert.new(concert_params)
    respond_to do |format|
      if @concert.save
        @consert_follower=ConcertFollower.new(user_id: current_user.id, concert_id: @concert.id, role_id: Role.where(name: "admin").first.id)
        @consert_follower.save
        format.html { redirect_to @concert, notice: 'Concert was successfully created.' }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to @concert, notice: 'Concert was successfully updated.' }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concert_params
      params.require(:concert).permit(:name, :place, :date, :country_id, :state_id, :city_id)
    end
end
