class UsersController < ApplicationController
  before_action :authenticate_user, except:  [:index, :create]
  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.create(
      name: params[:name],
      email: params[:email],
      image_url: params[:image_url],
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
      image_url: params[:image_url] || @user.image_url
    )

    if @user.valid?
      render :show
    else
      render json: { message: "There was error updating the user." }
    end
  end
end
