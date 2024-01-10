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
    )

    if @playdate.valid?
      render :show
    else
      render json: { message: "There was an error scheduling this playdate." }
    end
  end

  def update
    @playdate = Playdate.find(params[:id])
    if @playdate.update(playdate_params)
      render json: @playdate
    else
      render json: { errors: @playdate.errors.full_messages , status: :unprocessable_entity}
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

private

def playdate_params
  params.permit(:location, :time)
end
