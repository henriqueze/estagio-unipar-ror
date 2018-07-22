json.extract! payment_type, :id, :kind, :description, :interest_rates, :max_parcel, :created_at, :updated_at
json.url payment_type_url(payment_type, format: :json)
