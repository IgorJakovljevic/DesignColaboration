class UsersController < ApplicationController
  def new
  	@user = User.new
	@title = "Sign Up"
  end

  def create
	@user = User.new(user_params)
	if @user.save
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

  def show
  	@user = User.find(params[:id])
  end
end
