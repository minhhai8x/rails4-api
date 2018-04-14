class HomeController < ApplicationController
  include HomeHelper
  before_filter :set_user, :only => [:upload]
  before_filter :set_auth_client, :only => [:index, :oauth2callback]

  def index
    @user = User.new
  end

  def channels_list_by_username(service, part, **params)
    response = service.list_channels(part, params).to_json
    items = JSON.parse(response).fetch("items")

    results = []
    items.each do |item|
      channel = [
        'id' => item.fetch("id"),
        'title' => item.fetch("snippet").fetch("title"),
        'view_count' => item.fetch("statistics").fetch("viewCount")
      ]
      results << channel
    end

    results
  end

  def upload
    @user.name = FFaker::Name.name
    @user.address = FFaker::Address.street_address
    @user.sex = FFaker::Gender.random
    @user.phone = FFaker::PhoneNumber.phone_number
    
    if @user.avatar.present?
      @user.save!
    end

    render :json => { 'data' => @user }
  end

  def oauth2callback
    # Initialize the API
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.client_options.application_name = 'YouTube Data API Ruby Tests'
    @auth_client.code = params['code']
    @auth_client.fetch_access_token!
    service.authorization = @auth_client

    channels = channels_list_by_username(service, 'snippet,contentDetails,statistics', for_username: 'GoogleDevelopers')

    render :json => { 'data' => channels }
  end

  private
  
  def set_user
    @user = User.create(user_params)
  end

  def set_auth_client
    @auth_client = get_auth_client
    @oauth2_uri = @auth_client.authorization_uri.to_s
  end

  def user_params
    params.require(:user).permit(:avatar)
  end
end
