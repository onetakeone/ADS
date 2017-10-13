class TypesController < ApplicationController
  load_and_authorize_resource

  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])
  end

  def new
    @type = Type.new
  end

  def edit
    @type = Type.find(params[:id])
  end

  def create
    respond_to do |format|
      if @type.save
        format.html { redirect_to types_path, notice: t('types.notice.created') }
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @type.update(resource_params)
        format.html { redirect_to types_path, notice: t('types.notice.updated') }
      else
        render :edit
      end
    end
  end

  def destroy 
    @type.destroy
    respond_to do |format|
      format.html { redirect_to types_path, notice: t('types.notice.destroyed') }
    end
  end

  private

  def resource_params
    params.require(:type).permit(:ad_type)
  end
end
