class DogsController < ApplicationController
  before_action :authenticate_user
  def index
    @dogs = Dog.where(user_id: current_user.id)
    render :index
  end

  def create
    @dog = Dog.create(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      user_id: params[:user_id],
      image_url: params[:image_url]
    )

    if @dog.valid?
      render :show
    else
      render json: { message: "There was an error adding this pup" }
    end
  end

  def show
    @dog = Dog.find_by(id: params[:id], user_id: current_user.id)

    if @dog
      render :show
    else
      render json: { error: "Dog not found" }, status: :not_found
    end
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      render json: @dog
    else
      render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
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
  params.permit(:name, :breed, :age, :image_url)
end
