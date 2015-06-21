class DrawerController < ApplicationController

	Drawers = {
		drawer1: { content_image: ActionController::Base.helpers.asset_path("description1.jpg"), description: '得此籤者，必為神明護體、高分過關之人', type: 'asdf', id: 1 },
		drawer2: { content_image: ActionController::Base.helpers.asset_path("description1.jpg"), description: '1y2ye871y87ry8hsaj', type: 'asdf', id: 2 },
		drawer3: { content_image: ActionController::Base.helpers.asset_path("description1.jpg"), description: 'aksomlaks,lkaslksmkl', type: 'asdf', id: 3 }
	}

	def index
		cc = ["drawer1","drawer2","drawer3"].sample.to_sym

		if current_user
			if current_user.drawer_key
				cc = current_user.drawer_key.to_sym
				@drawResult = Drawers[cc]
			else
				current_user.drawer_key = cc
				current_user.save!
				@drawResult = Drawers[cc]
			end
		else

		end

		#c = CHNES[user.c.to_sym]
		#Drawers[:cc]
		#['嗨趴<br>高手過招課堂間<br>分數隨心收囊內<br>過往辛勞得回報<br>關中第一汝當先', '上上<br>前路光明正大道<br>程程載君步步高<br>似有鳳凰出關來<br>錦上添花衝雲霄', '中上<br>及第仕途路迢迢<br>格心持守苦讀勞<br>就在燈火闌珊處<br>好人終將得好報'].sample
	end
end
