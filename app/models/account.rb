class Account < ApplicationRecord
  belongs_to :user
  belongs_to :bank

  has_many :deposits
  has_many :received_transfers, foreign_key: :receiver_id, class_name: 'Transfer'
  has_many :sent_transfers, foreign_key: :sender_id, class_name: 'Transfer'

  def username
    User.find(self.user_id).username
  end

  def self.sorted_accounts
    sorted = []
    accounts = Account.all.to_a
    accounts.map! do |account|
      account.get_user_with_bank
    end
    accounts.sort!
    accounts.each do |account|
      sorted << Account.find_by(user: User.find_by(username: account.split(' - ')[0]), bank: Bank.find_by(name: account.split(' - ')[1]))
    end
    sorted
  end
end
