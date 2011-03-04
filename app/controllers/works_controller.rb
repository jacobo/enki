class WorksController < ApplicationController

  def index
    redirect_to url_for(:id => Work.first.id, :action => 'show')
  end

  def show
    @works = Work.find(:all, :order => "sort_number ASC")
    @work = Work.find(params[:id])
  end

end
