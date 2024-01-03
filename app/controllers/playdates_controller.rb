class PlaydatesController < ApplicationController
  def index
    @playdates = Playdate.all
    render :index
  end

  def create
    @playdate = Playdate.create(
      location: params[:location],
      time: params[:time],
      user_id: params[:user_id],
      dog_id: params[:dog_id],
    )

    if @playdate.valid?
      render :show
    else
      render json: { message: "There was an error scheduling this playdate." }
    end
  end

  def update
    @playdate = Playdate.find(params[:id])
    @playdate.update(
      location: params[:location] || @playdate.location,
      time: params[:time] || @playdate.time,
    )

    if @playdate.valid?
      render :show
    else
      render json: { message: "There was an error updating this playdate." }
    end
  end

  def show
    @playdate = Playdate.find(params[:id])
    render :show
  end

  def destroy
    playdate = Playdate.find(params[:id])
    playdate.destroy

    render json: { message: "Playdate successfully destroyed" }
  end
end
