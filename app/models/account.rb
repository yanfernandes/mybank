class Account < ApplicationRecord
  belongs_to :user
  belongs_to :bank

  has_many :deposits
  has_many :withdraws
  has_many :received_transfers, foreign_key: :receiver_id, class_name: 'Transfer'
  has_many :receivers, through: :received_transfers

  has_many :sent_transfers, foreign_key: :sender_id, class_name: 'Transfer'
  has_many :senders, through: :sent_transfers

  def username
    User.find(self.user_id).username
  end

  def self.get_all_users_with_banks
    accounts = Account.all
    usernames_and_banks = accounts.map do |account|
      User.find(account.user_id).username + " - " + Bank.find(account.bank_id).name
    end
    usernames_and_banks
  end

  def get_user_with_bank
    User.find(self.user_id).username + " - " + Bank.find(self.bank_id).name
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
