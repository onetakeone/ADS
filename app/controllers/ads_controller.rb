# frozen_string_literal: true

#
class AdsController < ApplicationController
  before_action :set_ad, only: %i[show edit update destroy]
  before_action :set_types, only: %i[show edit new index create]
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  helper LinkHelper

  def index
    ajax
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def ajax
    data = Ad.where(state: 'published')
    @ajax = data.search(params_search[:search])
              .order(sort_column + ' ' + sort_direction)
              .includes(:type, :user)
              .page(params[:page])
  end

  def show; end

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
        format.html do
          redirect_to user_ads_path(current_user),
                      notice: t('ads.notice.created')
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(resource_params)
        format.html do
          if current_user.role == 'admin'
            redirect_to users_path
          else
            redirect_to ads_path,
                        notice: t('ads.notice.updated')
          end
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ad.destroy
    respond_to do |format|
      format.html do
        redirect_to user_ads_path(@ad.user),
                    notice: t('ads.notice.destroyed')
      end
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
    params.require(:ad)
          .permit(:title, :body, :type_id, :image, :state,
                  pictures_attributes: %i[id image_src done _destroy])
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
