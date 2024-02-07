class FriendshipsController < ApplicationController
  before_action :authenticate_user

  def index
    @friendships = current_user.friendships
    render :index
  end

  def create
    @friendship = Friendship.create(
      user_id: current_user.id,
      friend_id: params[:friend_id],
    )

    if @friendship.valid?
      render :show
    else
      render json: { message: "There was an error making this friend." }
    end
  end

  def show
    @friendship = Friendship.find(params[:id])
    render :show
  end

  def update
  @friendship = Friendship.find(params[:id])

    # Update Friendship attributes using strong parameters
    if @friendship.update(friendship_params)
      render :show
    else
      render json: { errors: @friendship.errors.full_messages, status: :unprocessable_entity }
    end

  end

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy
    if !friendship
      render json: { message: "This friendship is over!" }
    else
      render json: { error: friendship.errors.full_messages, status: :unprocessable_entity }
    end
  end

end

private

def friendship_params
  params.permit(:status)
end

