class UserToGroupsController < ApplicationController
  before_action :authenticate_user!
 def create
    @group=Group.find(params[:group_id])
    @user_to_group=UserToGroup.new(:group_id => @group.id, :user_id => current_user.id, :role_id=> Role.where(name: "user").first.id)
    @user_to_group.save
    redirect_to :back
   end


  def destroy  
    @user_to_group=UserToGroup.find(params[:id])
    @user_to_group.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
