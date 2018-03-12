class HomeController < ApplicationController
  include HomeHelper
  def index
    @oauth2_uri = oauth2uri
  end

  def oauth2callback
    redirect_uri = 'http://localhost:3000/oauth2callback'
    account = Yt::Account.new authorization_code: params['code'], redirect_uri: redirect_uri
    # p account.email
    # account.videos #=> (lists a video to an account’s playlist)
    p 'testing...'
  end
end
