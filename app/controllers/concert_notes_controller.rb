class ConcertNotesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_posts

  def index
  end

  def create
    @post = ConcertNote.new(post_params)
    @post.user_id= current_user.id
    @concert=Concert.find(params[:concert_id])
    if @concert!=nil 
      @post.concert_id=@concert.id
      if @post.save
        redirect_to :back
      else
        @feed_items = []
        redirect_to :back
      end
    end   
  end

  def destroy
    @post=ConcertNote.find(params[:id])
    @post.destroy
    redirect_to :back
  end


  private
    def post_params
      params.require(:concert_note).permit(:text)
      
    end

    def load_posts
      @posts =ConcertNote.where(user_id: current_user)
    end
 

end