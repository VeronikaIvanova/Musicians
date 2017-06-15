class InstrumentalistToGroupsController < ApplicationController
  before_action :authenticate_user! 
  def new
    @instrumentalist_to_group=InstrumentalistToGroup.new
  end

  def create
    @group=Group.find(params[:group_id])   
    @instrumentalist=Instrumentalist.where(user_id: params[:user_id], instrument_id: params[:instrument_id]).first
    if @instrumentalist!=nil  
      @instrumentalist_to_group=InstrumentalistToGroup.new(:instrumentalist_id => @instrumentalist.id, :group_id => @group.id)
      @user_to_group=UserToGroup.new(:group_id => @group.id, :user_id => @instrumentalist.user_id, :role_id=> Role.where(name: "admin").first.id)
      @user_to_group.save
      @instrumentalist_to_group.save
    end
    redirect_to :back
  end

  def destroy   
    @instrumentalist_to_group=InstrumentalistToGroup.find(params[:id])
    @instrumentalist_to_group.destroy
    redirect_to :back
  end

end