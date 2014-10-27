class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_user

  def load_user
    @user = User.where(:id => session[:user_id]).first if session[:user_id]
    puts "You've logged in as #{@user}."
    puts "session user id: #{session[:user_id]}"
  end

  def ensure_logged_in
    if session[:user_id].blank?
      redirect_to :controller => "welcome", :action => "index"
    end
  end
end
