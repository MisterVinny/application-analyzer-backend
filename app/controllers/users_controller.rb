class UsersController < ApplicationController

  before_action :authenticate_user, except: [:create]

  def create
    user = User.new({
      username: params[:username],
      email: params[:email],
      address: params[:address],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    })
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = current_user
    render json: user
  end
  
  def update
    user = current_user
    user.username = params[:username] || user.username
    user.address = params[:address] || user.address
    user.email = params[:email] || user.email
    if user.save
      render json: user, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    user = current_user
    user.destroy
    render json: { message: "User has been successfully deleted." }
  end
end
