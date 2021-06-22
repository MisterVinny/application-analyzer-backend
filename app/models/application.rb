class Application < ApplicationRecord
  belongs_to :user
  validates :employer, presence: true
  validates :address, presence: true
  validates :position, presence: true
  validates :date, presence: true
  validates :method, presence: true
  validates :enthusiasm, presence: true, numericality: {only_integer: true}
  validates :confidence, presence: true, numericality: {only_integer: true}

end
