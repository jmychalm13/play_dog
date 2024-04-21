class CloudinaryTestController < ApplicationController
  def index
  end

  def upload
    @uploaded_image = Cloudinary::Uploader.upload(params[:image])
    puts @uploaded_image.inspect
    render :index
  end
end
