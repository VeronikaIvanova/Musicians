class ConcertFollowersController < ApplicationController
  before_action :authenticate_user!
  def create
    @concert=Concert.find(params[:concert_id])
    @concert_follower=ConcertFollower.new(:concert_id => @concert.id, :user_id => current_user.id, :role_id=> Role.where(name: "user").first.id)
    @concert_follower.save
    redirect_to :back
   end


  def destroy  
    @concert_follower=ConcertFollower.find(params[:id])
    @concert_follower.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
