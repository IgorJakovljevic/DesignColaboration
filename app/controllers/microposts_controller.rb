class MicropostsController < ApplicationController
	

	def micropost_params
	      params.require(:micropost).permit(:contet)
	end
end
