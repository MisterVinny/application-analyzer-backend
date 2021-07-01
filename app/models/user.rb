class User < ApplicationRecord
  has_secure_password
  has_many :applications
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :address, presence: true
end
