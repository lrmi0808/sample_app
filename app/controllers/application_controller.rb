class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  include SessionsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    #current_user.locale
    #request.env["HTTP_ACCPET LANGUAGE"]
  end

  def default_url_options(options = {})
    {locale:I18n.locale}.merge options
  end
end
