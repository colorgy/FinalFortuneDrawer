class ProxyController < ApplicationController
	def index
		url = URI.parse(Base64.decode64(params[:url]))
	    image = Net::HTTP.get_response(url)
	    send_data image.body, type: image.content_type, disposition: 'inline'
	end

  API_URI = URI.parse('https://api.imgur.com')
  API_PUBLIC_KEY = "Client-ID #{ENV['IMGUR_APP_ID']}"

  def image_upload
    if current_user
      post_param = {
        image: params[:image].split(',')[1]
      }

      request = Net::HTTP::Post.new(API_URI.request_uri + '3/image')
      request.set_form_data(post_param)
      request.add_field('Authorization', API_PUBLIC_KEY)
      response = web_client.request(request)

      if image_url = JSON.parse(response.body)['data']['link']
        current_user.image_url = image_url
        current_user.save!
      end
      render :json => {status: "ok"}
    else
      render :json => {status: "access denied"}, status: 501
    end

  end

  private
  def web_client
    http = Net::HTTP.new(API_URI.host, API_URI.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end
end
