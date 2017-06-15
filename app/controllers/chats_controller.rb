class ChatsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_chat, only: [:show, :edit, :update, :destroy]
  before_action :messages_for_chat, only: [:show]
  
  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.joins(:chat_participants).where(chat_participants: { user_id: current_user.id })
  end

  # GET /chats/1
  # GET /chats/1.json
  def show  
    @message=Message.new
    @messages=@chat.messages
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
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
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

end
