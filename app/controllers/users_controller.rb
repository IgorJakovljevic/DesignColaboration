class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]

  def new
  	@user = User.new
	@title = "Sign Up"
  end

  def create
	@user = User.new(user_params)
	if @user.save
    sign_in @user
		flash[:success] = "You have signed up"
		redirect_to root_path
	else
		@title = "Sign up"
		render 'new'
	end
  end

  def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

  def update
  @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit User"
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  def authenticate
  deny_access unless signed_in?
  end

end
