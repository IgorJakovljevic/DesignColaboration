class MicropostsController < ApplicationController

	before_filter :authenticate, :only => [:create, :destroy]

	def create

		@micropost = current_user.microposts.create(:content => params[:micropost][:content])

		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to current_user
		else
			render 'pages/home'
		end
	end

	def destroy
	end

	def micropost_params
	      params.require(:micropost).permit(:content)
	end

end
