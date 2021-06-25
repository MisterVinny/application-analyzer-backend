class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :employer, :address, :position, :date, :contact, :email, :followup, :interviews, :status, :enthusiasm, :confidence, :notes

  attribute :method

  def method
    object.method
  end
  

end
