Cloudinary.config do |config|
  config.cloud_name = Rails.application.credentials.cloudinary.production[:cloud_name]
  config.api_key = Rails.application.credentials.cloudinary.production[:api_key]
  config.api_secret = Rails.application.credentials.cloudinary.production[:api_secret]
end
