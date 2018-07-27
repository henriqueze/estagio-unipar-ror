json.extract! backoffice_sale, :id, :date, :total_value, :discount_value, :state, :person_id, :created_at, :updated_at
json.url backoffice_sale_url(backoffice_sale, format: :json)
