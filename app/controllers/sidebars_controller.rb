class SidebarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friends, only: [:friends, :feeds]

  def friends
    @friends=@friends.paginate(:page => params[:page], :per_page =>10)  
  end


  def friends_requests
    @requests= Friend.where("(user1= :user1) and status_id= :status", user1: current_user.id, status: Status.where(name: "request").first.id).paginate(:page => params[:page], :per_page =>10)  
  end

  def groups
    @groups= Group.find(UserToGroup.where(user_id: current_user.id).pluck(:group_id)).paginate(:page => params[:page], :per_page =>10)  
  end


  def groups_admins
    @groups_admin= Group.find(UserToGroup.where(user_id: current_user.id, role_id: Role.where(name: "admin").first.id).pluck(:group_id)).paginate(:page => params[:page], :per_page =>10)  
  end

  def feeds
   ids= [@friends.pluck(:user1), @friends.pluck(:user2)]
   @users_feeds= UserNote.where(:user_id => ids)
   @group_feeds= GroupNote.where(:group_id => UserToGroup.where(user_id: current_user).pluck(:group_id))
   @concert_feeds= ConcertNote.where(:concert_id => ConcertFollower.where(user_id: current_user).pluck(:concert_id))
   @feeds_all= @users_feeds | @group_feeds | @concert_feeds
   @feeds_all=@feeds_all.sort_by{ |elem| elem.created_at }.reverse
   #@feeds=@feeds_all.first(500) 
   @feeds=@feeds_all.paginate(:page => params[:page], :per_page =>10)  
  end

  def concerts
    @concerts= Concert.find(ConcertFollower.where(user_id: current_user.id).pluck(:concert_id)).paginate(:page => params[:page], :per_page =>10) 
  end
 
  def concerts_admins
    @concerts_admin= Concert.find(ConcertFollower.where(user_id: current_user.id, role_id: Role.where(name: "admin").first.id).pluck(:concert_id)).paginate(:page => params[:page], :per_page =>10) 
  end

  def set_friends
    @friends= Friend.where("(user1= :user1  or user2= :user1) and status_id= :status", user1: current_user.id, status: Status.where(name: "agreed").first.id)  
  end


end