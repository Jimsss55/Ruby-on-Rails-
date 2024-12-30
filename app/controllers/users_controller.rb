class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update ]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [ :edit, :update]
  def new
    @user = User.new
  end

  def show
    @articles = @user.articles
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to articles_path, notice: "Welcome #{@user.name}, you have successfully signed in." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "Your Account information, Successfully updated" }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "All data related to the users will be deleted"
    redirect_to articles_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit your own usr Profile"
      redirect_to @user
    end
  end

end
