class Bank < ApplicationRecord
  has_many :accounts
  has_many :deposits
  has_many :users, through: :accounts

  validates :name, {presence: true, uniqueness: true}
end
