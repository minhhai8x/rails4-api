module HomeHelper
  def get_auth_client
    require 'google/apis/youtube_v3'

    auth_client = Signet::OAuth2::Client.new(
      :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
      :token_credential_uri =>  'https://www.googleapis.com/oauth2/v3/token',
      :client_id => '<client_id>',
      :client_secret => '<client_secret>',
      :scope => 'https://www.googleapis.com/auth/youtubepartner',
      :redirect_uri => 'http://localhost:3000/oauth2callback'
    )

    auth_client
  end
end
