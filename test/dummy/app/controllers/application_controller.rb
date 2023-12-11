class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    I18n.locale = current_locale
  end

  def current_locale
    if params[:locale].present?
      cookies[:locale] = params[:locale]
    end
    cookies[:locale] || I18n.default_locale
  end
end
