json.extract! transaction, :id, :user_id, :store_id, :category_id, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
