class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable,
         :omniauth_providers => [:colorgy]

  def self.from_colorgy(auth)
    user = where(:id => auth.info.id).first_or_create!

    attrs = %i(avatar_url name fbid fbtoken)

    oauth_params = ActionController::Parameters.new(auth.info)
    user_data = oauth_params.slice(*attrs).permit(*attrs)

    user_data['refreshed_at'] = Time.now
    # user_data['core_access_token'] = auth.credentials.token

    user.update!(user_data)

    return user
  end
end
