class ChatsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_chat, only: [:show, :edit, :update, :destroy]
  before_action :set_friends, only: [:new, :edit]
  
  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.joins(:chat_participants).where(chat_participants: { user_id: current_user.id })
  end

  # GET /chats/1
  # GET /chats/1.json
  def show  
    if ChatParticipant.where(user_id: current_user, chat_id: @chat.id)==nil
      redirect_to :back
    else
      @message=Message.new
      @messages=Message.where(chat_id: @chat.id).distinct.order(created_at: :desc).paginate(:page => params[:page], :per_page =>8)
    end
  end
 
  # GET /chats/new
  def new
    @chat = Chat.new    
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new(chat_params)       
    respond_to do |format|
      if @chat.save
	@chat.chat_participants.create(:user => current_user)
        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
        format.json { render :show, status: :created, location: @chat }        
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat_participant=ChatParticipant.where(user_id: current_user.id, chat_id: @chat.id)
    @chat_participant.destroy
    if !ChatParticipant.where(chat_id: @chat.id)
      @chat.destroy
    end
     redirect_to chats_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    def chat_participant_params
      params.require(chat_participant).permit(:user_id, :chat_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:Theme, user_ids: [])
    end
    
    def messages_for_chat
      @messages = Message.where(chat_id: @chat.id) 
    end
    def set_friends
      @friends1=User.find(Friend.where(user2: current_user).pluck(:user1))
      @friends2=User.find(Friend.where(user1: current_user).pluck(:user2))
      @friends= @friends1 | @friends2
    end

end
