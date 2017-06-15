class FriendsController < ApplicationController
  before_action :authenticate_user! 
  def new
    @friend=Friend.new
  end

  def create
    @user=User.find(params[:user_id])   
    if @user!=nil 
      @friend=Friend.new
      @friend.user1=@user.id
      @friend.user2=current_user.id
      @friend.status_id=Status.where(name: "request").first.id
      @friend.save
    end
    redirect_to :back
  end

  def destroy   
    @friend=Friend.find(params[:id])
    @friend.destroy
    redirect_to :back
  end

 def add  
    @friend=Friend.find(params[:id])
    @friend.status_id=Status.where(name: "agreed").first.id
    @friend.save   
   
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end


end