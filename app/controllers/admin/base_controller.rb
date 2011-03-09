class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :require_login

  # # def view_context_class
  # #   view_context_class_to_return = super
  # #   puts "view_context_class_to_return #{view_context_class_to_return}"
  # #   class << view_context_class_to_return
  # #     def find_template(*args)
  # #       to_return = super(*args)
  # #       puts "find_template #{args.inspect} -- #{to_return}"
  # #       to_return
  # #     end
  # #   end
  # #   view_context_class_to_return
  # # end
  # def lookup_context
  #   to_return = super
  #   puts "lookup_context #{to_return.inspect}"
  #   to_return.view_paths << FileSystemResolver.new("default")
  #   to_return
  # end

  protected

  def current_object
    instance_variable_get("@#{current_model.name.underscore}")
  end

  def current_objects
    instance_variable_get("@#{current_model.name.pluralize.underscore}")
  end

  def require_login
    puts session.inspect
    return redirect_to(admin_session_path) unless session[:logged_in]
  end

  def set_content_type
    headers['Content-Type'] ||= 'text/html; charset=utf-8'
  end

end
