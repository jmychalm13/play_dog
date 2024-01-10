class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
    render :index
  end

end
