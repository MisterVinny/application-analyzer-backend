class UsersController < ApplicationController

  before_action :authenticate_user, except: [:create]

  def create
    user = User.new({
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    })
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    if params[:id].to_i == current_user.id.to_i
      user = User.find(params[:id])
      render json: user.as_json
    else
      render json: { errors: "Unauthorized to view content." }, status: :unauthorized
    end
    
  end
  
  def update
    if params[:id].to_i == current_user.id.to_i
      user = User.find(params[:id])
      user.username = params[:username] || user.username
      user.address = params[:address] || user.address
      user.email = params[:email] || user.email
  
      if user.save
        render json: { message: "User updated successfully" }, status: :ok
      else
        render json: { errors: user.errors.full_messages }, status: :bad_request
      end

    else
      render json: { errors: "Unauthorized to edit content." }, status: :unauthorized
    end
  end

  def destroy
    if params[:id].to_i == current_user.id.to_i
      user = User.find(params[:id])
      user.destroy
      render json: { message: "User has been successfully deleted." }
    else
      render json: { errors: "Unauthorized to delete user." }, status: :unauthorized
    end

  end
  
  
end
