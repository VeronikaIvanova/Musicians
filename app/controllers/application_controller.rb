class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def countries
    render json: CS.countries.to_json
  end

  def states
    render json: CS.states(params[:countries]).to_json
  end

  def cities
    render json: CS.cities(params[:states]).to_json
  end

  def instruments
    render json: Instrument.find(Instrumentalist.where(user_id: params[:user_id]).pluck(:instrument_id)).to_json
  end

  protected
    def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname,:lastname, :email, :password, :date_of_birth, :info, :country_name, :state_name, :city_name, :gender_id, instrument_ids: [] ) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :current_password, :date_of_birth, :info,  :country_name, :state_name, :city_name, :gender_id, instrument_ids: []   ) }
    end
end

