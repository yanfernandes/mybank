class Deposit < ApplicationRecord
  belongs_to :account
  belongs_to :bank
end
