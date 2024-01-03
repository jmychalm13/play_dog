class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    render :index
  end

  def create
    @dog = Dog.create(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      user_id: params[:user_id]
    )
    render :show
  end

  def show
    @dog = Dog.find(params[:id])
    render :show
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(
      name: params[:name] || @dog.name,
      breed: params[:breed] || @dog.breed,
      age: params[:age] || @dog.age,
    )
    if @dog.valid?
      render :show
    else
      render json: { message: "There was an error updating this dog." }
    end
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    render json: { message: "This pooch has been destroyed!" }
  end
end
