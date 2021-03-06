class User < ApplicationRecord
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}
	validates_conformations_of :password, if: lambda{ |u| u.password.present? }
end
