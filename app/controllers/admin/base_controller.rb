class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :require_login

  protected

  def current_object
    instance_variable_get("@#{current_model.name.underscore}")
  end
  
  def current_objects
    instance_variable_get("@#{current_model.name.pluralize.underscore}")
  end

  def require_login
    return redirect_to(admin_session_path) unless session[:logged_in]
  end

  def set_content_type
    headers['Content-Type'] ||= 'text/html; charset=utf-8'
  end
    
end
