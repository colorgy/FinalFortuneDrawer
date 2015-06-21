class UsersController < ApplicationController
	DRAWERS = {
		drawer1: { content_image: ActionController::Base.helpers.asset_path("description1.jpg"), description: '得此籤者，必為神明護體、高分過關之人', type: 'asdf', id: 1 },
		drawer2: { content_image: ActionController::Base.helpers.asset_path("description2.jpg"), description: '得此籤者，必為功成名就、隨便都過之人', type: 'asdf', id: 2 },
		drawer3: { content_image: ActionController::Base.helpers.asset_path("description3.jpg"), description: '得此籤者，必為吉人天相，因禍得福之人', type: 'asdf', id: 3 },
		drawer4: { content_image: ActionController::Base.helpers.asset_path("description4.jpg"), description: '得此籤者，必為一分耕耘，一分收獲之人', type: 'asdf', id: 4 },
		drawer5: { content_image: ActionController::Base.helpers.asset_path("description5.jpg"), description: '得此籤者，必為九死一生，驚險連連之人', type: 'asdf', id: 5 },
		drawer6: { content_image: ActionController::Base.helpers.asset_path("description6.jpg"), description: '得此籤者，您還是洗洗睡了吧', type: 'asdf', id: 6 },
		drawer7: { content_image: ActionController::Base.helpers.asset_path("description7.jpg"), description: '得此籤者，請密切注意貴校之休、退學門檻', type: 'asdf', id: 7 },
		drawer8: { content_image: ActionController::Base.helpers.asset_path("description8.jpg"), description: '得此籤者，近日將有清純可愛學妹，為您打氣祝福', type: 'asdf', id: 8 },
		drawer9: { content_image: ActionController::Base.helpers.asset_path("description9.jpg"), description: '得此籤者，近日將有無敵萬用學弟，為您跑腿辦事（順便請客）', type: 'asdf', id: 9 },
		drawer10: { content_image: ActionController::Base.helpers.asset_path("description10.jpg"), description: '得此籤者，近日將有超猛神人學長，為您指點迷津', type: 'asdf', id: 10 },
		drawer11: { content_image: ActionController::Base.helpers.asset_path("description11.jpg"), description: '得此籤者，近日將有慈悲為懷學姊，為您代送便當 <3', type: 'asdf', id: 11 },
		drawer12: { content_image: ActionController::Base.helpers.asset_path("description12.jpg"), description: '得此籤者，近日將有大刀闊斧教授，為您表演人體切割', type: 'asdf', id: 12 },
		drawer13: { content_image: ActionController::Base.helpers.asset_path("description13.jpg"), description: '得此籤者，請即刻登出召喚峽谷，全心讀書為上', type: 'asdf', id: 13 },
		drawer14: { content_image: ActionController::Base.helpers.asset_path("description14.jpg"), description: '得此籤者，請即刻登出 Line、Beetalk，清心寡慾以學業為上', type: 'asdf', id: 14 },
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
						@user.drawer_key = drawer_key
						@user.save!
						@drawResult = DRAWERS[drawer_key]
					end
				else # not my result page
					if @user.drawer_key # user has drawer_key
						@drawResult = DRAWERS[@user.drawer_key.to_sym]
					else
						redirect_to root_path
					end
				end
			else
				# not logged in
				if @user.drawer_key # user has drawer_key
					@drawResult = DRAWERS[@user.drawer_key.to_sym]
				else
					redirect_to root_path
				end
			end
		else
			redirect_to root_path
		end
	end
end
