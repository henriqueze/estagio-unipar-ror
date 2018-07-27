json.extract! backoffice_product, :id, :product_code, :description, :purchase_price, :sale_price, :profit_margin, :stock, :stock_reserved, :category_id, :created_at, :updated_at
json.url backoffice_product_url(backoffice_product, format: :json)
