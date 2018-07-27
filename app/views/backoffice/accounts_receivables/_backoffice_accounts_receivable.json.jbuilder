json.extract! backoffice_accounts_receivable, :id, :state, :description, :kind, :issue_date, :expiration_date, :received_date, :total_value, :received_value, :remaining_value, :total_parcels, :parcel, :sales_id, :payment_type_id, :system_user_id, :created_at, :updated_at
json.url backoffice_accounts_receivable_url(backoffice_accounts_receivable, format: :json)
