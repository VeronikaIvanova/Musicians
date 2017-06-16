class MessagesController < ApplicationController
  before_action :authenticate_user! 
  respond_to :html, :js
  def new
  end

  def create
    @message = current_user.messages.build(message_params)
    @chat= Chat.find(params[:chat_id])
    @messages=Message.where(chat_id: @chat.id).order(created_at: :desc).paginate(:page => params[:page], :per_page =>8) 
    @message.chat_id=@chat.id  
      if @message.save
        sync_new @message
      end
    redirect_to :back
 end

  def destroy
    @message= Message.find(params[:id])
    @message.destroy
     respond_to do |format|
      format.html { redirect_to :back, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def message_params
      params.require(:message).permit(:text)      
    end
end
