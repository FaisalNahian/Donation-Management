class Admin::ApplicationController < ApplicationController
  helper_method :current_admin_session, :current_admin
  before_filter :require_admin
  layout 'admin'
  
  private
    def current_admin_session
      return @current_admin_session if defined?(@current_admin_session)
      @current_admin_session = AdminSession.find
    end
  
    def current_admin
      return @current_admin if defined?(@current_admin)
      @current_admin = current_admin_session && current_admin_session.record
    end
  
    def require_admin
      if !request[:controller].include? "admin/sessions" and !current_admin
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_admin_session_url
        return false
      end
    end

    def require_no_admin
      if current_admin
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to admins_url
        return false
      end
    end
end
