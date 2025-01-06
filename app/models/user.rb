class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: { message: "Email is already taken" }
  validates :password, presence: true, length: { minimum: 6, message: "must be at least 6 characters" }
end
