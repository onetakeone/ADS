class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :set_types, only: [:show, :edit, :new, :index, :create]

  def index
    @ads = Ad.where(state: 'published').page(params[:page])
  end

  def show
    @users = User.all
  end

  def new
    @user = current_user
    @ad = @user.ads.new
    @options = []
    @types.each do |t|
      @options << [t.ad_type, t.id]
    end
    authorize! :create, Ad
  end

  def edit
    @states = []
    @ad.state_transitions.each do |t|
      @states << t.to_name
    end
    @options = []
    @types.each do |t|
      @options << [t.ad_type, t.id]
    end
    authorize! :edit, Ad
  end

  def create
    @user = current_user
    @ad = @user.ads.new(ad_params)
    respond_to do |format|
      if @ad.save
        format.html { redirect_to user_ads_path(@user), notice: 'Ad was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to ads_path, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to user_ads_path(@ad.user), notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def set_types
    @types = Type.all
  end

  def ad_params
    params.require(:ad).permit(:title, :body, :type_id, :image, :state, pictures_attributes: [:id, :image_src, :done, :_destroy])
  end
end
