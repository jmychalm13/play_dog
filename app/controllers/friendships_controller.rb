class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
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

end
