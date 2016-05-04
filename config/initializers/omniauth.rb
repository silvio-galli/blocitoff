Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
  provider :facebook, Rails.application.secrets.facebook_api_key, Rails.application.secrets.facebook_api_secret, scope: 'public_profile', info_fields: 'id,name,link'
  provider :google_oauth2, Rails.application.secrets.google_api_key, Rails.application.secrets.google_api_secret
  #facebook
  #google scope: 'profile', image_aspect_ratio: 'square', image_size: 32, access_type: 'online'
end
