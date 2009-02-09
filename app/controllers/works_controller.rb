class WorksController < ApplicationController
  
  def index
    redirect_to work_url(Work.find(:first))
  end
  
  def show
    @work = Work.find(params[:id])
  end
  
end
