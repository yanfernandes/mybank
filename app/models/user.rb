class User < ApplicationRecord
  has_secure_password

  has_many :accounts
  has_many :banks, through: :accounts

  validates :username, {presence: true, uniqueness: true}
  validates :password, {presence: true, length: { in: 6..10 }}
  validates_confirmation_of :password
  validates_presence_of :password_confirmation, { case_sensitive: true}
end
