class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page])
    authorize! :manage, User
  end

  def edit
    @user = User.find(params[:id])
    authorize! :manage, User
  end

  def new
    @user = User.new
    authorize! :manage, User
  end

  def ads
    @user = User.find(params[:id])
    @ads = @user.ads.order('created_at').reverse_order.page(params[:page])
    authorize! :create, Ad
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :role, :email, :password)
  end
end
