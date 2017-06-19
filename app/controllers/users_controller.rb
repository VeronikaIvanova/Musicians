require 'will_paginate/array'
class UsersController < ApplicationController

  def index
  @users = User.order(:created_at)
  @gender = Gender.all
  if !params[:name].blank?
   @name=params[:name].downcase
   @users=@users.where("lower(firstname) like :name or lower(lastname) like :name",name: "%#{@name}%")
  end

  if !params[:genders].blank? 
    genders = params[:genders]
    @users = @users.where(:gender_id => genders)
  end

 if !params[:country_id].blank? 
    country=params[:country_id]
    @users = @users.where(:country_id => country.id)
  end

 if !params[:state_id].blank? 
    state=params[:state_id]
    @users = @users.where(:state_id => state.id)
  end

 if !params[:city_id].blank?
    city=params[:city_id]
    @users= @users.where(:city_id => city.id)
  end

 @users = @users.paginate(:page => params[:page], :per_page =>10)
end
  
  def show
    @user = User.find(params[:id])
    @user_note=UserNote.new
    @friend=Friend.where("user1= :user1 and user2= :user2 or user2= :user1 and user1= :user2",user1: @user.id, user2: current_user.id).first
    if @friend==nil
      @friend=Friend.new
    end
    @posts=UserNote.where(user_id: @user.id).order(created_at: :desc).paginate(:page => params[:page], :per_page =>5)
    
  end

  def write_message
      @user = User.find(params[:id])

      if @user!=nil
        @chat= Chat.new(:Theme=> @user.firstname + " "+ current_user.firstname)   
        @chat.save
        @chat_participant=ChatParticipant.new(user_id: current_user.id, chat_id: @chat.id)
        @chat_participant.save
        @chat_participant=ChatParticipant.new(user_id: @user.id, chat_id: @chat.id)
        @chat_participant.save
        redirect_to chat_path(@chat.id)
      else 
        redirect_to :back
      end 
  end
  

end
