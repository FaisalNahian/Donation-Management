class PasswordResetsController < ApplicationController
   before_filter :require_no_user
   before_filter :load_user_using_perishable_token, :only => [:edit, :update]

  def new
  end

  def create  
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you. " +
      "Please check your email."
      redirect_to root_url
    else
      flash[:notice] = "No user was found with that email address"
      render :action => :new
    end
  end

  def edit
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Your password was changed successfully"
      redirect_to root_url # where should this really go? accounts_url nil
    else
      render :action => :edit
    end
   end

end
