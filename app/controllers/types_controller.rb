class TypesController < ApplicationController
  def index
    @types = Type.all
    authorize! :edit, Type
  end

  def show
    @type = Type.find(params[:id])
  end

  def new
    @type = Type.new
    authorize! :edit, Type
  end

  def edit
    @type = Type.find(params[:id])
    authorize! :edit, Type
  end

  def create
    @type = Type.new(params_type)
    @type.save(params_type)
    redirect_to types_path
  end

  def update
    @type = Type.find(params[:id])
    @type.update(params_type)
    redirect_to types_path
  end

  def destroy 
  end

  private

  def params_type
    params.require(:type).permit(:ad_type)
  end
end
