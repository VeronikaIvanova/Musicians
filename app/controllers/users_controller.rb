class UsersController < ApplicationController

  def index
  @users = User.order(:created_at)
  @gender = Gender.all

  if !params[:name].blank?
   @name=params[:name]
   @users=@users.where("firstname like :name or lastname like :name",name: "%#{@name}%")
  end

  if !params[:genders].blank?
    genders = params[:genders]
    @users = @users.where(:gender_id => genders)
  end

 if !params[:country_name].blank?
    country=params[:country_name]
    @users = @users.where(:country_name => country)
  end

 if !params[:state_name].blank?
    state=params[:state_name]
    @users = @users.where(:state_name => state)
  end

 if !params[:city_name].blank?
    city=params[:city_name]
    @users= @users.where(:city_name => city)
  end
end
  
  def show
    @user = User.find(params[:id])
    @user_note=UserNote.new
    @friend=Friend.where("user1= :user1 and user2= :user2 or user2= :user1 and user1= :user2",user1: @user.id, user2: current_user.id).first
    if @friend==nil
      @friend=Friend.new
    end
  end

  

end
