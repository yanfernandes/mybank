json.extract! transfer, :id, :sender_id, :receiver_id, :amount, :created_at, :updated_at
json.url transfer_url(transfer, format: :json)
