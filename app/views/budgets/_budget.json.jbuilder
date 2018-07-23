json.extract! budget, :id, :kind, :note, :date, :expiration_date, :total_value, :state, :person_id, :created_at, :updated_at
json.url budget_url(budget, format: :json)
