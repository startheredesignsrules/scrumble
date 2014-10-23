class SessionsController < ApplicationController

  def new
    
  end

  def create
    if (params[:name].blank? || params[:email].blank?)
      # If form is empty, show an error
      redirect_to_back
      flash[:error] = "Please fill out both fields."

    elsif User.find_by_email(params[:email])
      # If user exists already, sign them in
      #sign_in user
      #redirect_to user
      flash[:success] = "Good to see you again!"
    else
      # If user doesn't exist, error
      redirect_to_back
      flash[:error] = "That user doesn't exist. Please sign up."
    end
  end

  def destroy
    
  end

end
