class Admin::ImagesController < Admin::BaseController
  before_filter :find_image, :only => [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.html {
        @images = Image.paginate(
          :order => "created_at DESC",
          :page  => params[:page]
        )
      }
    end
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Created image '#{@image.title}'"
          redirect_to(:action => 'show', :id => @image)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new',         :status => :unprocessable_entity }
      end
    end
  end

  def update
    if @image.update_attributes(params[:image])
      respond_to do |format|
        format.html {
          flash[:notice] = "Updated image '#{@image.title}'"
          redirect_to(:action => 'show', :id => @image)
        }
      end
    else
      puts @image.errors.full_messages.inspect
      respond_to do |format|
        format.html { render :action => 'show',        :status => :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html {
        render :partial => 'image', :locals => {:image => @image} if request.xhr?
      }
    end
  end

  def new
    @image = Image.new
  end

  def preview
    @image = Image.build_for_preview(params[:image])

    respond_to do |format|
      format.js {
        render :partial => 'images/image.html.erb'
      }
    end
  end

  def destroy
    @image.destroy
    puts "Destrouyed #{@image.inspect}"
    
    respond_to do |format|
      format.html do
        flash[:notice] = "Deleted image '#{@image.title}'"
        redirect_to :action => 'index'
      end
      format.json {
        render :json => {
          :undo_path    => "/",
          :undo_message => "Image deleted",
          :image         => @image
        }.to_json
      }
    end
  end

  protected

  def current_model
    Image
  end

  def find_image
    @image = Image.find(params[:id])
  end
end
