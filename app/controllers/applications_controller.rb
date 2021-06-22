class ApplicationsController < ApplicationController

  before_action :authenticate_user

  def index
    applications = Application.where("user_id = ?", current_user.id)
    render json: applications.as_json
  end
  
  def create
    application = Application.new({
      user_id: current_user.id,
      employer: params[:employer],
      address: params[:address],
      position: params[:position],
      date: params[:date],
      contact: params[:contact],
      email: params[:email],
      followup: false,
      method: params[:method],
      interviews: 0,
      status: "pending",
      enthusiasm: params[:enthusiasm],
      confidence: params[:confidence],
      notes: params[:notes]
    })
    if application.save
      render json: { message: "Application added successfully." }, status: :ok
    else
      render json: { errors: application.errors.full_messages }, status: :bad_request
    end
  end
  
  def show
    application = Application.find(params[:id])
    if application.user_id == current_user.id
      render json: application
    else
      render json: { errors: "Unauthorized to view content." }, status: :unauthorized
    end
  end

  def update
    application = Application.find(params[:id])
    if application.user_id == current_user.id
      application.employer = params[:employer] || application.employer
      application.address = params[:address] || application.address
      application.position = params[:position] || application.position
      application.date = params[:date] || application.date
      application.contact = params[:contact] || application.contact
      application.email = params[:email] || application.email
      application.followup = params[:followup] || application.followup
      application.method = params[:method] || application.method
      application.interviews = params[:interviews] || application.interviews
      application.status = params[:status] || application.status
      application.enthusiasm = params[:enthusiasm] || application.enthusiasm
      application.confidence = params[:confidence] || application.confidence
      application.notes = params[:notes] || application.notes

      if application.save
        render json: { message: "Application updated successfully." }, status: :ok
      else
        render json: { errors: application.errors.full_messages }, status: :bad_request
      end
    else
      render json: { errors: "Unauthorized to edit content." }, status: :unauthorized
    end
  end
  
  def destroy
    application = Application.find(params[:id])
    if application.user_id == current_user.id
      application.destroy
      render json: {message: "The application has been successfully deleted."}, status: :ok
    else
      render json: { errors: "Unauthorized to delete content." }, status: :unauthorized
    end
  end
end
