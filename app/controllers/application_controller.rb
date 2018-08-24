class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery
  protect_from_forgery with: :exception
  include SessionsHelper
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :set_locale
  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def user_not_authorized
    flash[:warning] = "Thêm 1 lần ăn block -_-"
    redirect_to root_path
  end
end
