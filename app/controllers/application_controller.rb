# frozen_string_literal: true

#
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :personal_filter

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role username])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[role username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[role username])
  end

  def personal_filter
    @personal_filter ||= Ad.ransack(params[:q])
    if params[:q]
      @myads ||= @personal_filter.result.where(user: current_user)
                                 .includes(:user, :type)
                                 .order('created_at')
                                 .reverse_order.page(params[:page])
    end
  end
end
