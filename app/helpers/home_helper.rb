module HomeHelper
  def get_auth_client
    require 'google/apis/youtube_v3'

    auth_client = Signet::OAuth2::Client.new(
      :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
      :token_credential_uri =>  'https://www.googleapis.com/oauth2/v3/token',
      :client_id => '1018402081253-eb9of8qgppehjdhtd0c0196d50uqj1gd.apps.googleusercontent.com',
      :client_secret => '3VIIyoPXaS9-KWFhyUalLG74',
      :scope => 'https://www.googleapis.com/auth/youtubepartner',
      :redirect_uri => 'http://localhost:3000/oauth2callback'
    )

    auth_client
  end
end
