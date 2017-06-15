class GroupNotesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_posts

  def index
  end

  def create
    @post = GroupNote.new(post_params)
    @post.user_id= current_user.id
    @group=Group.find(params[:group_id])
    if @group!=nil 
      @post.group_id=@group.id
      if @post.save
        redirect_to :back
      else
        @feed_items = []
        redirect_to :back
      end
    end   
  end

  def destroy
    @post=GroupNote.find(params[:id])
    @post.destroy
    redirect_to :back
  end


  private
    def post_params
      params.require(:group_note).permit(:text)
      
    end

    def load_posts
      @posts =GroupNote.where(user_id: current_user)
    end
 

end