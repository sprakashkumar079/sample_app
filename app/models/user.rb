class User < ApplicationRecord
  #checking the  validation of name and email
  before_save { self.email = email.downcase }
  #validation for name
  validates :name, presence: true, length: { maximum: 50 }
  #validation for email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: true
  #secure password machinery will be implemented using a single Rails method
  has_secure_password
  #validation of password and length of password
  validates :password, presence: true, length: { minimum: 6 }
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
