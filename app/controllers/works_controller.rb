class WorksController < ApplicationController

  def index
    first_work = Work.order("sort_number ASC").where("category IS NOT NULL AND category <> ''").first
    first_category = first_work.category
    redirect_to url_for(:category => first_category.gsub(" ","_").underscore, :action => 'show')
  end

  def show
    category = params[:category].humanize
    @works = Work.find(:all, :conditions => ["category = ?", category], :order => "sort_number ASC")
    # @work = Work.find(params[:id])
    # if request.xhr?
    #   render :partial => 'work'
    # end
  end

  def show_work
    category = params[:category].humanize
    @works = Work.find(:all, :conditions => ["category = ?", category], :order => "sort_number ASC")
    @work = Work.find(params[:id])
    # render :text => "ok"
  end

end
