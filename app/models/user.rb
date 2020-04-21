class User < ApplicationRecord
  validates :first_name, presence: true
  validates :password, length: { minimum: 6 }
  has_secure_password
  has_many :todos
end
