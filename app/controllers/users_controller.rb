class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :load_user_using_perishable_token, :only => [ :confirm_account ]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      if params[:user][:type] == 'Partner'
        flash[:notice] = "Your partner organization application has been submitted"
      else
        flash[:notice] = "You have signed up successfully and will receive an" +
                         " email with instructions to verify your account"
      end
      @user.deliver_user_confirmation!
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end

  def confirm_account
    @user.active = true
    @user.save!
    UserSession.create( @user, true )
    flash[:notice] = "Congratulations! Your account is now active."
    redirect_to root_url
  end
end
