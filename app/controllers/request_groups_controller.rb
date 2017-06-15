class RequestGroupsController < ApplicationController
  before_action :authenticate_user!
  def add  
    @concert=Concert.find(params[:concert_id])
    @group=Group.find(params[:group_id])
    @concert_participant=ConcertParticipant.where(group_id: @group.id, concert_id: @concert.id).first
    @concert_participant.status_id=Status.where(name: "agreed").first.id
    @concert_participant.save   
   
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

end