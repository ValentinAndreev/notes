require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_many :plans, dependent: :destroy
  has_many :tasks, through: :plans
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(username, password)
    user = User.where(username: username).first
    user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) ? user : nil
  end 
end