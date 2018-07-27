json.extract! backoffice_purchase, :id, :date, :total_value, :freight_value, :person_id, :created_at, :updated_at
json.url backoffice_purchase_url(backoffice_purchase, format: :json)
