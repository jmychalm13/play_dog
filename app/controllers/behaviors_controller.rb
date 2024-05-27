class BehaviorsController < ApplicationController
  def index
    @behaviors = Behavior.all
    render :index
  end

  def create
    pp params[:behavior][:dog_id]
    params[:behavior_attributes].each do |x|
      @behavior = Behavior.create(
        dog_id: params[:behavior][:dog_id],
        behavior: x[:behavior],
        rating: x[:rating]
      )
    end
    # @behavior = Behavior.create(
    #   dog_id: params[:dog_id],
    #   behavior: params[:behavior]
    # )
    # render :show
  end

  def show
    @behavior = Behavior.find(params[:id])
    render :show
  end

  def update
    @behavior = Behavior.find(params[:id])
    @behavior.update(
      behavior: params[:behavior] || behavior.behavior
    )
    render :show
  end

  def destroy
    @behavior = Behavior.find(params[:id])
    @behavior.destroy
    render json: { message: "This behavior has been deleted" }
  end
end
