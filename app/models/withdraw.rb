class Withdraw < ApplicationRecord
  belongs_to :account
  belongs_to :bank

  def fulfill_withdraw
    self.account.update(balance: self.account.balance - self.amount)
  end

  def print_interest_rate
    self.interest_rate.truncate(3).to_s + "%"
  end

  def print_bank
    Bank.find(self.bank_id).name
  end
end
