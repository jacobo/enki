class Admin::WorksController < Admin::BaseController
  before_filter :find_work, :only => [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.html {
        @works = Work.paginate(
          :order => "created_at DESC",
          :page  => params[:page]
        )
      }
    end
  end

  def create
    @work = Work.new(params[:work])
    if @work.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Created work '#{@work.title}'"
          redirect_to(:action => 'show', :id => @work)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new',         :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    if @work.update_attributes(params[:work])
      respond_to do |format|
        format.html {
          flash[:notice] = "Updated work '#{@work.title}'"
          redirect_to(:action => 'show', :id => @work)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'show',        :status => :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html {
        render :partial => 'work', :locals => {:work => @work} if request.xhr?
      }
    end
  end

  def new
    @work = Work.new
  end

  def preview
    @work = Work.build_for_preview(params[:work])

    respond_to do |format|
      format.js {
        render :partial => 'works/work.html.erb'
      }
    end
  end

  def destroy
    @work.destroy

    respond_to do |format|
      format.html do
        flash[:notice] = "Deleted work '#{@work.title}'"
        redirect_to :action => 'index' 
      end
      format.json { 
        render :json => {
          :undo_path    => "/",
          :undo_message => "Work deleted",
          :work         => @work
        }.to_json
      }
    end
  end

  protected

  def find_work
    @work = Work.find(params[:id])
  end
end
