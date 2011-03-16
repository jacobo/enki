class ContactController < ApplicationController

  def index
    if params[:message]
      @render_thank_you = true
    else
      @render_form = true
    end
  end

  def create
    Rails.logger.info("TODO: " + params.inspect)
    redirect_to :action => 'index', :message => "thank_you"
  end

end
