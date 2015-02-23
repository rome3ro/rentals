class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!, :except => [:some_action_without_auth]
  before_filter :set_user_language
  rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      redirect_to root_url
  end
  
  def set_user_language
    I18n.locale = 'es_MX'
   
  end
end
