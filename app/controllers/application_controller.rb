class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def countries
    render json: CS.countries.to_json
  end

  def states
     render json: State.where(country_id: params[:id]).to_json
  end   

  def cities
     render json: City.where(state_id: params[:id]).to_json      
  end
 
  def instruments
    render json: Instrument.find(Instrumentalist.where(user_id: params[:user_id]).pluck(:instrument_id)).to_json
  end

  protected
    def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname,:lastname, :country_id, :state_id, :email, :password, :date_of_birth, :info, :city_id, :gender_id, instrument_ids: [] ) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :lastname, :email,:country_id, :state_id,  :password, :current_password, :date_of_birth, :info,  :city_id, :gender_id, instrument_ids: []   ) }
    end
end

