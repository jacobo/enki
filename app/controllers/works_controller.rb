class WorksController < ApplicationController

  def index
    fetch_works
    render :show
  end

  def show
    fetch_works
    if request.headers['X-PJAX']
      render :layout => false
    end
  end

  private

  def fetch_works
    @works = Work.find(:all, :order => "sort_number ASC", :limit => 9)
    if params[:id]
      @work = Work.find(params[:id])
    else
      @work = Work.first
    end
    index = @works.index(@work)
    if index > 0
      @previous_work = @works[index - 1]
    end
    if index < @works.size
      @next_work = @works[index + 1]
    end
  end

end
