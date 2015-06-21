class DrawerController < ApplicationController

	def index

	end

	def draw
		if current_user
			redirect_to "/users/#{current_user.id}"
		else
			redirect_to user_omniauth_authorize_path(:colorgy)
		end
	end
end
