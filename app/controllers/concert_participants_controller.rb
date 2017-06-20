class ConcertParticipantsController < ApplicationController
  before_action :authenticate_user! 
  def new
    @concert_participant=ConcertParticipant.new
  end

  def create
    @concert=Concert.find(params[:concert_id])   
    if @concert!=nil and params[:group_id]!=nil
      @concert_participant=ConcertParticipant.new(participant_params)

        @concert_participant.concert_id=@concert.id
        if ConcertFollower.where(user_id: current_user.id, concert_id: @concert.id, role_id: Role.where(name: "admin").first.id).first!=nil
          @concert_participant.status_id=Status.where(name: "agreed").first.id
        else
          @concert_participant.status_id=Status.where(name: "request").first.id
         end
        @concert_participant.save
      end

    redirect_to :back
  end

  def destroy   
    @concert_participant=ConcertParticipant.find(params[:id])
    @concert_participant.destroy
    redirect_to :back
  end

  def participant_params
      params.require(:concert_participant).permit(:group_id)
  end

end