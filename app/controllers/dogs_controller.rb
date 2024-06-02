class DogsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  def index
    @dogs = Dog.all
    render :index
  end

  def create
    user_id = params[:user_id]

    image_url = params[:image_url]

    if params[:image_url]
      response = Cloudinary::Uploader.upload(params["image_url"], resource_type: :auto)
      image_url = response["secure_url"]
    end

    existing_dog = Dog.find_by(user_id: user_id, name: params[:name])

    if existing_dog
      render json: {error: "There is already a pet with that name in the database"}
    else
      @dog = Dog.create(
        name: params[:name],
        age: params[:age],
        breed: params[:breed],
        user_id: params[:user_id],
        image_url: image_url
      )
  
      if @dog.valid?
        render :show
      else
        render json: { message: "There was an error adding this pup" }
      end
    end

  end

  def show
    @dog = Dog.find_by(id: params[:id])

    if @dog
      render :show
    else
      render json: { error: "Dog not found" }, status: :not_found
    end
  end

  def update
    @dog = Dog.find(params[:id])

    if params[:dog][:image_url].present? && params[:dog][:image_url].is_a?(ActionDispatch::Http::UploadedFile)
      uploaded_file = params[:dog][:image_url]
      cloudinary_response = Cloudinary::Uploader.upload(uploaded_file.tempfile.path)
      image_url = cloudinary_response["secure_url"]
      if @dog.update(dog_params.merge(image_url: image_url))
        render json: @dog
      else
        render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
      end
    else
      if @dog.update(dog_params)
        render json: @dog
      else
        render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    render json: { message: "This pooch has been destroyed!" }
  end
end

private

def dog_params
  params.require(:dog).permit(:name, :breed, :age, :image_url)
end
