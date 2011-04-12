class ContactController < ApplicationController

  def index
    if params[:message]
      @render_thank_you = true
    else
      @render_form = true
    end
  end

  def create
    email = ContactForm.contact(params).deliver
    redirect_to :action => 'index', :message => "thank_you"
  end

end
