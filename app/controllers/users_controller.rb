class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    if (params[:name].blank? || params[:email].blank?)
      # If any field is blank, say so.
      redirect_to_back
      flash[:error] = "Those fields can't be blank, dude."
      return

    elsif User.find_by_email(params[:email])
      # If user exists, redirect to user (log in)
      @user = User.find_by_email(params[:email])
      session[:user_id] = @user.id
      redirect_to "/home"
      puts "session user id: #{session[:user_id]}"
      flash[:success] = "Good to see you again!"
      return
    end

    # If user doesn't exist, create user and redirect them to the home page
    @user = User.create(:name => params[:name], :email => params[:email])
    session[:user_id] = @user.id
    redirect_to "/home"
    puts "session user id: #{session[:user_id]}"
    flash[:success] = "Welcome. Now you can start using scrumble."
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:email, :avatar_url, :name)
    end
end
