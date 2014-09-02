class UsersController < ApplicationController
  def new
  	@user = User.find(params[:id])
	@title = @user.name
  end

  def show
  	@user = User.find(params[:id])
  end
end
