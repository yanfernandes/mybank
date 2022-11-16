json.extract! deposit, :id, :account_id, :bank_id, :amount, :created_at, :updated_at
json.url deposit_url(deposit, format: :json)
