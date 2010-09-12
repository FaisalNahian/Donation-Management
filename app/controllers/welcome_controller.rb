class WelcomeController < ApplicationController
  def index
    @user = User.new
  end
  
  def terms_of_service
  end
end
