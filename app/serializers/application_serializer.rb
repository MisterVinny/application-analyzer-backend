class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :employer, :address, :position, :date, :contact, :email, :followup, :interviews, :status, :enthusiasm, :confidence, :notes, :updated_at, :created_at

  #try moving : method up later
  attribute :method
  
  attribute :distance, if: :current_user


  def method
    object.method
  end
  
  def distance
    object.distance_to(current_user)  
  end

end
