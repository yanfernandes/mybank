json.extract! account, :id, :user_id, :bank_id, :balance, :created_at, :updated_at
json.url account_url(account, format: :json)
