class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    render :show
  end

  def show
    @user = User.find(params[:id])
    :show
  end

  # todo: user update method
  # def update
  #   @user = User.find(params[:id])
  #   @user.update(
  #     name: params[:name] || @user.name,
  #     email: params[:email] || @user.email,
  #     password: @user.password,
  #     password_confirmation: @user.password_confirmation
  #   )

  #   render :show
  # end
end
