class UserNotesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_posts

  def index
  end

  def create
    @post = UserNote.new(post_params)
    @post.user_id= current_user.id
    if @post.save
      redirect_to :back
    else
      @feed_items = []
      redirect_to :back
    end
  end

  def destroy
    @post=UserNote.find(params[:id])
    @post.destroy
    redirect_to :back
  end


  private
    def post_params
      params.require(:user_note).permit(:text)
      
    end

    def load_posts
      @posts =UserNote.where(user_id: current_user)
    end
 

end