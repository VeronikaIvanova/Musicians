class MessagesController < ApplicationController

  def new
  end

  def create
    @message = current_user.messages.build(message_params)
    @chat= Chat.find(params[:chat_id])
    @message.chat_id=@chat.id  
    @message.save
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
