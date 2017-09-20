class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  def index
    @ads = Ad.all
    @users = User.all
    @types = Type.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @user = current_user
    @ad = @user.ads.new
    @types = Type.all
    @options = []
    @types.each do |t|
      @options << [t.ad_type, t.id]
    end
  end

  def edit
  end

  def create
    @user = current_user
    @ad = @user.ads.new(ad_params)    
    @types = Type.all
    @options = []
    @types.each do |t|
      @options << [t.ad_type, t.id]
    end

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
      else
        format.html { render :new }        
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
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
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :body, :type_id, :image, pictures_attributes: [:id, :image_src, :done, :_destroy])
    end
end
