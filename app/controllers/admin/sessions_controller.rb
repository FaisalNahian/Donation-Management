class Admin::SessionsController < Admin::ApplicationController
  before_filter :require_no_admin, :only => [:new, :create]
  
  def new
    @admin_session = AdminSession.new
  end
  
  def create
    @admin_session = AdminSession.new(params[:admin_session])
    if @admin_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default admin_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_admin_session.destroy if current_admin_session
    flash[:notice] = "Signed out successfully"
    redirect_back_or_default '/'
  end
end
