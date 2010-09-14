class Admin::PagesController < Admin::ApplicationController
  before_filter :require_admin
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Page successfully created!"
      redirect_back_or_default admin_url
    else
      render :action => :new
    end
  end
  
  def index
    @pages = Page.paginate :page => params[:page]
  end
  
  def deactivate
    page = Page.find(params[:id])
    page.deactivate!
    redirect_to :action => :index
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])
    flash[:notice] = "User has been successfully updated"
    render :action => :edit
  end
end