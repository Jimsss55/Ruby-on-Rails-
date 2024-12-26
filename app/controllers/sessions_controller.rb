class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        format.html do
          session[:user_id] = user.id
          flash[:notice] = "User Authenticated"
          redirect_to user
        end
      else
        format.html do
          flash.now[:alert] = "Incorrect Email or Password"
          render 'new'
        end
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end
end
