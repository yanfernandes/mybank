json.extract! withdraw, :id, :account_id, :bank_id, :amount, :created_at, :updated_at
json.url withdraw_url(withdraw, format: :json)
