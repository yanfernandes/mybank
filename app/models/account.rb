class Account < ApplicationRecord
  belongs_to :user
  belongs_to :bank

  has_many :deposits
  has_many :received_transfers, foreign_key: :receiver_id, class_name: 'Transfer'
  has_many :sent_transfers, foreign_key: :sender_id, class_name: 'Transfer'
end
