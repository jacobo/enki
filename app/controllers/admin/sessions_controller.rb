class Admin::SessionsController < ApplicationController
  protect_from_forgery
  layout 'login'

  def show
    if using_open_id?
      create
    else
      redirect_to :action => 'new'
    end
  end

  def new
  end

  #create user with: AuthorizedUser.create(:username => 'admin', :password_hash => Password::encrypt_password('admin'))
  def create
    return successful_login if allow_login_bypass? && params[:bypass_login]
    if authorized_user = AuthorizedUser.find_by_username(params[:username])
      if Password::verify_password_against_hash(params[:password], authorized_user.password_hash)
        return successful_login
      end
    end
    flash.now[:error] = "You are not authorized"
    render :action => 'new'
    # authenticate_with_open_id(params[:openid_url]) do |result, identity_url|
    #   if result.successful?
    #     if config.author_open_ids.include?(URI.parse(identity_url))
    #       return successful_login
    #     else
    #       flash.now[:error] = "You are not authorized"
    #     end
    #   else
    #     flash.now[:error] = result.message
    #   end
    #   render :action => 'new'
    # end
  end

  def destroy
    session[:logged_in] = false
    redirect_to('/')
  end

protected

  def successful_login
    session[:logged_in] = true
    redirect_to(admin_root_path)
  end

  def allow_login_bypass?
    %w(development test).include?(Rails.env)
  end
  helper_method :allow_login_bypass?
end
