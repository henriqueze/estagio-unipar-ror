json.extract! backoffice_budget, :id, :kind, :note, :date, :expiration_date, :total_value, :state, :person_id, :created_at, :updated_at
json.url backoffice_budget_url(backoffice_budget, format: :json)
