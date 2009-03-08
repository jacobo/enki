class WorksController < ApplicationController
  
  def index
    first_category = Work.find(:first, :order => "sort_number ASC").category
    redirect_to url_for(:category => first_category.underscore, :action => 'show')
  end
  
  def show
    category = params[:category].humanize
    @works = Work.find(:all, :conditions => ["category = ?", category], :order => "sort_number ASC")
    # @work = Work.find(params[:id])
    # if request.xhr?
    #   render :partial => 'work'
    # end
  end
    
end
