class DrawerController < ApplicationController

	def index
		# if current_user
		# 	redirect_to "/users/#{current_user.id}"
		# end
	end

	def draw
		if current_user
			redirect_to "/users/#{current_user.id}"
		else
			redirect_to user_omniauth_authorize_path(:colorgy)
		end
	end
end
