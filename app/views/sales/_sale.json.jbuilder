json.extract! sale, :id, :date, :total_value, :discount_value, :state, :person_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
