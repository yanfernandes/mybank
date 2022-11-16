class Withdraw < ApplicationRecord
  belongs_to :account
  belongs_to :bank
end
