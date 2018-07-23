json.extract! purchase, :id, :date, :total_value, :freight_value, :person_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
