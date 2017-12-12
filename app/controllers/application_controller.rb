class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery


    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
