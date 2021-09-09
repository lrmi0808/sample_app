class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  include SessionsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale:I18n.locale}.merge options
  end

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t("please_log_in")
      redirect_to login_url
    end
  end
end
