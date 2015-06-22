class UsersController < ApplicationController
  DRAWERS = {
    drawer1: { content_image: "description1.jpg", description: '得此籤者，必為神明護體、高分過關之人', type: 'asdf', id: 1 },
    drawer2: { content_image: "description2.jpg", description: '得此籤者，必為功成名就、隨便都過之人', type: 'asdf', id: 2 },
    drawer3: { content_image: "description3.jpg", description: '得此籤者，必為吉人天相，因禍得福之人', type: 'asdf', id: 3 },
    drawer4: { content_image: "description4.jpg", description: '得此籤者，必為一分耕耘，一分收獲之人', type: 'asdf', id: 4 },
    drawer6: { content_image: "description6.jpg", description: '得此籤者，您還是洗洗睡了吧', type: 'asdf', id: 6 },
    drawer7: { content_image: "description7.jpg", description: '得此籤者，請密切注意貴校之休、退學門檻', type: 'asdf', id: 7 },
    drawer8: { content_image: "description8.jpg", description: '得此籤者，近日將有清純可愛學妹，為您打氣祝福', type: 'asdf', id: 8 },
    drawer9: { content_image: "description9.jpg", description: '得此籤者，近日將有無敵萬用學弟，為您跑腿辦事（順便請客）', type: 'asdf', id: 9 },
    drawer10: { content_image: "description10.jpg", description: '得此籤者，近日將有超猛神人學長，為您指點迷津', type: 'asdf', id: 10 },
    drawer11: { content_image: "description11.jpg", description: '得此籤者，近日將有慈悲為懷學姊，為您代送便當 <3', type: 'asdf', id: 11 },
    drawer12: { content_image: "description12.jpg", description: '得此籤者，近日將有大刀闊斧教授，為您表演人體切割', type: 'asdf', id: 12 },
    drawer13: { content_image: "description13.jpg", description: '得此籤者，請即刻登出召喚峽谷，全心讀書為上', type: 'asdf', id: 13 },
    drawer14: { content_image: "description14.jpg", description: '得此籤者，請即刻登出 Line、Beetalk，清心寡慾以學業為上', type: 'asdf', id: 14 },
    drawer15: { content_image: "description6.jpg", description: '得此籤者，您還是洗洗睡了吧', type: 'asdf', id: 15 },
    drawer16: { content_image: "description6.jpg", description: '得此籤者，您還是洗洗睡了吧', type: 'asdf', id: 16 },
    drawer17: { content_image: "description6.jpg", description: '得此籤者，您還是洗洗睡了吧', type: 'asdf', id: 17 },
    drawer18: { content_image: "description6.jpg", description: '得此籤者，您還是洗洗睡了吧', type: 'asdf', id: 18 },
    drawer19: { content_image: "description6.jpg", description: '得此籤者，您還是洗洗睡了吧', type: 'asdf', id: 19 },
    drawer20: { content_image: "description6.jpg", description: '得此籤者，您還是洗洗睡了吧', type: 'asdf', id: 20 },
    drawer21: { content_image: "description13.jpg", description: '得此籤者，請即刻登出召喚峽谷，全心讀書為上', type: 'asdf', id: 21 },
    drawer22: { content_image: "description14.jpg", description: '得此籤者，請即刻登出 Line、Beetalk，清心寡慾以學業為上', type: 'asdf', id: 22 },
    drawer23: { content_image: "description13.jpg", description: '得此籤者，請即刻登出召喚峽谷，全心讀書為上', type: 'asdf', id: 23 },
    drawer24: { content_image: "description14.jpg", description: '得此籤者，請即刻登出 Line、Beetalk，清心寡慾以學業為上', type: 'asdf', id: 24 },
    drawer25: { content_image: "description13.jpg", description: '得此籤者，請即刻登出召喚峽谷，全心讀書為上', type: 'asdf', id: 25 },
    drawer26: { content_image: "description14.jpg", description: '得此籤者，請即刻登出 Line、Beetalk，清心寡慾以學業為上', type: 'asdf', id: 26 },
    drawer27: { content_image: "description8.jpg", description: '得此籤者，近日將有清純可愛學妹，為您打氣祝福', type: 'asdf', id: 27 },
    drawer28: { content_image: "description8.jpg", description: '得此籤者，近日將有清純可愛學妹，為您打氣祝福', type: 'asdf', id: 28 },
    drawer29: { content_image: "description15.jpg", description: '得此籤者，全班同學的期末成績就靠你了！', type: 'asdf', id: 29 },
    drawer30: { content_image: "description16.jpg", description: '得此籤者，請速速銷毀所有作弊用道具，光明正大作戰為上。', type: 'asdf', id: 30 },
    drawer31: { content_image: "description17.jpg", description: '得此籤者，須當心考試看錯題目，多看窗外遠景、顧眼為上', type: 'asdf', id: 31 },
    drawer32: { content_image: "description15.jpg", description: '得此籤者，全班同學的期末成績就靠你了！', type: 'asdf', id: 32 },
    drawer33: { content_image: "description16.jpg", description: '得此籤者，請速速銷毀所有作弊用道具，光明正大作戰為上。', type: 'asdf', id: 33 },
    drawer34: { content_image: "description17.jpg", description: '得此籤者，須當心考試看錯題目，多看窗外遠景、顧眼為上', type: 'asdf', id: 34 },
    drawer35: { content_image: "description15.jpg", description: '得此籤者，全班同學的期末成績就靠你了！', type: 'asdf', id: 35 },
    drawer36: { content_image: "description16.jpg", description: '得此籤者，請速速銷毀所有作弊用道具，光明正大作戰為上。', type: 'asdf', id: 36 },
    drawer37: { content_image: "description17.jpg", description: '得此籤者，須當心考試看錯題目，多看窗外遠景、顧眼為上', type: 'asdf', id: 37 },
    drawer38: { content_image: "description7.jpg", description: '得此籤者，請密切注意貴校之休、退學門檻', type: 'asdf', id: 38 },
    drawer39: { content_image: "description7.jpg", description: '得此籤者，請密切注意貴校之休、退學門檻', type: 'asdf', id: 39 },
    drawer40: { content_image: "description7.jpg", description: '得此籤者，請密切注意貴校之休、退學門檻', type: 'asdf', id: 40 },
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

  def shared_callback
    if current_user
      current_user.shared = true
      current_user.save!
    end

    render json: {}
  end

  def userall

    if current_user && current_user.is_admin
      @users = User.all
    else
      redirect_to root_path
    end

  end
end
