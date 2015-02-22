class SessionsController < ApplicationController
  def create
    @auth = request.env["omniauth.auth"]
    @user = User.find_by_provider_and_uid(@auth["provider"], @auth["uid"]) || User.create_with_omniauth(@auth)
    @current_user=User.find(@user.id)
    @username = @current_user.username
    options = {:count => 10, :include_rts => true}
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'mpH50RB1we6Fz6LPJktiMpP1O'
      config.consumer_secret     = 'QbtcUszbdzxzPqrGU5lbncUMlHZNmFxN17LanASCLrZVVRc9QV'
      config.access_token        = @current_user.auth_token
      config.access_token_secret = @current_user.auth_token_secret
    end
    @tweets = @client.user_timeline(@username,options)
  end
  
  def destroy
    redirect_to root_url, :notice => "Signed out!"
  end
end
