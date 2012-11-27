class WorksController < ApplicationController

  def index
    @title = 'JBird Creations | Graphic and Interactive Design'
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
    @show_bottom_stuff = true
    all_works = Work.find(:all, :order => "sort_number ASC", :limit => 9)
    found = []
    @category_works = all_works.select{|x| use = !found.include?(x.category); found << x.category; use}
    if params[:id]
      @work = Work.find(params[:id])
    else
      @work = Work.first
    end
    @category = @work.category
    @works = Work.find(:all, :order => "sort_number ASC", :limit => 9, :conditions => ["category = ?", @category])
    index = @works.index(@work)
    if index > 0
      @previous_work = @works[index - 1]
    end
    if index < @works.size
      @next_work = @works[index + 1]
    end
  end

end
