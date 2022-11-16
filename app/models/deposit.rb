class Deposit < ApplicationRecord
  belongs_to :user
  belongs_to :bank
end
