module HomeHelper
  def oauth2uri
    Yt.configure do |config|
      config.client_id = '<client_id>'
      config.client_secret = '<client_secret>'
      config.log_level = :debug
    end
    scopes = ['youtube.readonly']
    redirect_uri = 'http://localhost:3000/oauth2callback'
    auth_url = Yt::Account.new(scopes: scopes, redirect_uri: redirect_uri).authentication_url
    auth_url
  end
end
