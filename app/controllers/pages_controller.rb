class PagesController < ApplicationController
  def show
    @page = Page.find_by_url_slug(params[:path].join('/'))
    redirect_to '/404.html', :status => 404 if !@page
  end
end