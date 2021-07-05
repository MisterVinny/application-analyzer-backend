class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :employer, :address, :position, :date, :contact, :email, :followup, :interviews, :status, :enthusiasm, :confidence, :notes, :updated_at, :created_at

  attribute :method

  def method
    object.method
  end
  

end
