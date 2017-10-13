class UsersController < ApplicationController
  load_and_authorize_resource 
  skip_authorize_resource :only => :ads

  def index
    @users = User.all.includes(:ads).page(params[:page])
  end

  def edit
    @user = User.find(params[:id])    
  end

  def new
    @user = User.new
  end

  def ads
    @q      = current_user.ads.ransack(params[:q])
    @search = @q.result.where(user: current_user).includes(:type).order('created_at').reverse_order.page(params[:page])
  end

  def create
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: t('users.notice.created') }
      else
        render :new
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(resource_params)
        format.html { redirect_to users_path, notice: t('users.notice.updated') }
      else
        render :edit
      end
    end
  end

  def destroy    
    @user.destroy
    respond_to do |format|
        format.html { redirect_to users_path, notice: t('users.notice.destroyed') }
    end
  end

  private

  def resource_params
    params.require(:user).permit(:username, :role, :email, :password)
  end
end
