class AnswersController < ApplicationController
  before_action :authenticate_user!
  def create
    @vacancy=Vacancy.find(params[:vacancy_id])
    @answer=Answer.new(:vacancy_id => @vacancy.id, :user_id => current_user.id)
    @answer.save
    redirect_to :back
   end


  def destroy  
   # @answer=Answer.where(vacancy_id: @vacancy.id, user_id: current_user.id)
   @answer=Answer.find(params[:id]) 
   @answer.destroy
    respond_to do |format|     
      format.html { redirect_to :back }
      format.js
    end   
  end
end
