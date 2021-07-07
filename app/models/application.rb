class Application < ApplicationRecord
  belongs_to :user
  validates :employer, presence: true
  validates :address, presence: true
  validates :position, presence: true
  validates :date, presence: true
  validates :method, presence: true
  validates :enthusiasm, presence: true, numericality: {only_integer: true}
  validates :confidence, presence: true, numericality: {only_integer: true}
  validates :followup, inclusion: { in: [ true, false ], message: "must be true or false" }
  validates :status, presence: true
  validates :interviews, numericality: { greater_than_or_equal_to: 0 }

  #for geocoder
  geocoded_by :address
  after_validation :geocode
end
