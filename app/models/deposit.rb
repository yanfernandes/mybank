class Deposit < ApplicationRecord
  belongs_to :account
  belongs_to :bank

  def fulfill_deposit
    self.account.update(balance: self.account.balance + self.amount)
  end

  def print_bank
    Bank.find(self.bank_id).name
  end
end
