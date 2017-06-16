class GroupsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_group, only: [:show, :edit, :update, :destroy, :write_message]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @genres = Genre.all

    if !params[:genres].blank?
      genres = params[:genres]
      @groups=Group.find(GroupToGenre.where(:genre_id=> genres).pluck(:group_id))
    end

    if !params[:name].blank?
      @groups=params[:name]
      @groups=@groups.where("name like :name ",name: "%#{@name}%")
    end

    if !params[:country_name].blank?
      country=params[:country_name]
      @groups = @groups.where(:country_name=> country)
    end

    if !params[:state_name].blank?
      state=params[:state_name]
      @groups = @groups.where(:state_name => state)
    end

    if !params[:city_name].blank?
      city=params[:city_name]
      @groups= @groups.where(:city_name => city)
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
   @instrumentalist_to_group=InstrumentalistToGroup.new
   @user_to_group=UserToGroup.where(user_id: current_user.id, group_id: @group.id).order(created_at: :desc).first
    if @user_to_group==nil
      @user_to_group=UserToGroup.new
    end
   @vacancy=Vacancy.new
   @group_note=GroupNote.new
  end

  # GET /groups/new
  def new
    @group = Group.new
    @instrumentalist_to_group=InstrumentalistToGroup.new
  end

  # GET /groups/1/edit
  def edit
   @instrumentalist_to_group=InstrumentalistToGroup.new
  end
 
  def write_message
    @chat = Chat.new(:Theme => @group.name)
   
    @group_admins=User.find(UserToGroup.where(group_id: @group.id, role: Role.where(name: "admin").first.id).pluck(:user_id))
    if @group_admins!=nil
      @chat.save
      @chat_participant=ChatParticipant.new(user_id: current_user.id, chat_id: @chat.id)
      @group_admins.each do |user|
        @chat_participant=ChatParticipant.new(user_id: user.id, chat_id: @chat.id)
        @chat_participant.save
      end
      redirect_to chat_path(@chat.id)
    else
      redirect_to :back
    end
 end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
 
    respond_to do |format|
      if @group.save  
         @user_to_group=UserToGroup.new(:user_id => current_user.id, :group_id=>@group.id, :role_id => Role.where(name: 'admin').first.id)
         @user_to_group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :information, :city_name, :state_name, :country_name, genre_ids: [])
    end
end
