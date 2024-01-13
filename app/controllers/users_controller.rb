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
    if @user.valid?
      render :show, status: :created
    else
      render json: { message: "There was an error creating the user." }
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def update
    @user = User.find(params[:id])
    @user.update(
      name: params[:name] || @user.name,
      email: params[:email] || @user.email,
    )

    if @user.valid?
      render :show
    else
      render json: { message: "There was error updating the user." }
    end
  end
end
