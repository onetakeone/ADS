class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :set_types, only: [:show, :edit, :new, :index, :create]
  helper_method :sort_column, :sort_direction
  load_and_authorize_resource

  def index
   # @ads            = Ad.where(user: current_user).includes(:user, :type).page(params[:page])
   # @general_filter = Ad.ransack(params[:q])
   # @search         = @general_filter.result.where(state: 'published').includes(:user, :type).page(params[:page])
   # AJAX
    ajax
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def ajax
    @ajax = Ad.search(params_search[:search]).order(sort_column + " " + sort_direction).includes(:type, :user).page(params[:page])
  end

  def show
  end

  def new
    @user = current_user
    @ad   = @user.ads.new
    options
  end

  def edit
    @states = []
    @ad.state_transitions.each { |t| @states << t.to_name }
    options
  end

  def create
    respond_to do |format|
      if @ad.save
        format.html { redirect_to user_ads_path(current_user), notice: t('ads.notice.created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(resource_params)
        format.html { redirect_to ads_path, notice: t('ads.notice.updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to user_ads_path(@ad.user), notice: t('ads.notice.destroyed') }
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def set_types
    @types = Type.all
  end

  def options
    @options = []
    @types.each { |t| @options << [t.ad_type, t.id] }
  end 

  def resource_params
    params.require(:ad).permit(:title, :body, :type_id, :image, :state, pictures_attributes: [:id, :image_src, :done, :_destroy])
  end

  def sort_column
    Ad.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def params_search    
    params.permit(:released_at, :page, :sort, :utf8, :title, 
                  :body, :type_id, :search,
                  :authenticity_token, :commit, :direction, :_)
  end
end
