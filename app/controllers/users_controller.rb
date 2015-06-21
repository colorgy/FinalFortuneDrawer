class UsersController < ApplicationController
	DRAWERS = {
		drawer1: { content_image: ActionController::Base.helpers.asset_path("description1.jpg"), description: '得此籤者，必為神明護體、高分過關之人', type: 'asdf', id: 1 },
		drawer2: { content_image: ActionController::Base.helpers.asset_path("description1.jpg"), description: '1y2ye871y87ry8hsaj', type: 'asdf', id: 2 },
		drawer3: { content_image: ActionController::Base.helpers.asset_path("description1.jpg"), description: 'aksomlaks,lkaslksmkl', type: 'asdf', id: 3 }
	}


	def show
		@user = User.find_by_id(params[:id])

		if @user
			if current_user
				# logged in
				if @user == current_user # my result page
					if @user.drawer_key
						@drawResult = DRAWERS[@user.drawer_key.to_sym]
					else
						drawer_key = DRAWERS.keys.sample
						user.drawer_key = drawer_key
						user.save!
						@drawResult = DRAWERS[drawer_key]
					end
				else # not my result page
					if @user.drawer_key # user has drawer_key
						@drawResult = DRAWERS[@user.drawer_key.to_sym]
					else
						@drawResult = nil
					end
				end
			else
				# not logged in
				if @user.drawer_key # user has drawer_key
					@drawResult = DRAWERS[@user.drawer_key.to_sym]
				else
					@drawResult = nil
				end
			end
		else
			redirect_to root_path
		end
	end
end
