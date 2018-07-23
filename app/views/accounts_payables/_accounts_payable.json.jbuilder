json.extract! accounts_payable, :id, :state, :description, :document_kind, :document_number, :issue_date, :expiration_date, :payment_date, :total_parcels, :current_parcel, :payable_value, :additions_value, :discount_value, :total_value, :paid_value, :voucher_image, :purchase_id, :system_user_id, :created_at, :updated_at
json.url accounts_payable_url(accounts_payable, format: :json)
