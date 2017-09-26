class AdsController < ApplicationController
 
  
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :set_types, only: [:show, :edit, :new, :index, :create]

  def index
    @ads = Ad.where(state: 'published').page(params[:page])
    @users = User.all    
    @ad1 = @ads.first
  end

  def show
    @ad = Ad.find(params[:id])    
    @users = User.all
  end

  def new
    @user = current_user
    @ad = @user.ads.new
    @options = []
    @types.each do |t|
      @options << [t.ad_type, t.id]
    end
  end

  def edit
    @ad = Ad.find(params[:id])
    @states = []   
    @ad.state_transitions.each do |t|
      @states << t.to_name
    end  
    @options = []
    @types.each do |t|
      @options << [t.ad_type, t.id]
    end
  end

  def create
    @user = current_user
    @ad = @user.ads.new(ad_params)  
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
    def set_ad
      @ad = Ad.find(params[:id])
    end

    def set_types
      @types = Type.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title,:body,:type_id,:image,:state,pictures_attributes: [:id, :image_src, :done, :_destroy])
    end
end
