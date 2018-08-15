# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_10_232247) do

  create_table "accounts_payables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "state", limit: 20, default: "Aberta", null: false
    t.string "description", limit: 100, null: false
    t.string "document_kind", limit: 20
    t.string "document_number", limit: 100
    t.datetime "issue_date", null: false
    t.datetime "expiration_date", null: false
    t.datetime "payment_date"
    t.integer "total_parcels", default: 0, null: false
    t.integer "current_parcel", default: 0
    t.decimal "payable_value", precision: 10, null: false
    t.decimal "additions_value", precision: 10, default: "0"
    t.decimal "discount_value", precision: 10, default: "0"
    t.decimal "total_value", precision: 10, null: false
    t.decimal "paid_value", precision: 10, default: "0"
    t.binary "voucher_image", limit: 4294967295
    t.bigint "purchase_id"
    t.bigint "system_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_accounts_payables_on_purchase_id"
    t.index ["system_user_id"], name: "index_accounts_payables_on_system_user_id"
  end

  create_table "accounts_receivables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "state", default: "Aberta", null: false
    t.string "description", limit: 100, null: false
    t.string "kind", limit: 50
    t.datetime "issue_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "expiration_date", null: false
    t.datetime "received_date"
    t.decimal "total_value", precision: 10, null: false
    t.decimal "received_value", precision: 10, default: "0"
    t.decimal "remaining_value", precision: 10
    t.integer "total_parcels", default: 0, null: false
    t.integer "parcel"
    t.bigint "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_accounts_receivables_on_sale_id"
  end

  create_table "budgets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "kind", limit: 20
    t.string "note", limit: 200
    t.datetime "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "expiration_date", null: false
    t.decimal "total_value", precision: 10, null: false
    t.string "state", limit: 20, default: "Aberto", null: false
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_budgets_on_person_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_budgets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "amount", default: 0, null: false
    t.decimal "value", precision: 10, null: false
    t.bigint "product_id"
    t.bigint "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_item_budgets_on_budget_id"
    t.index ["product_id"], name: "index_item_budgets_on_product_id"
  end

  create_table "item_purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "amount", default: 0, null: false
    t.decimal "value", precision: 10, null: false
    t.bigint "product_id"
    t.bigint "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_item_purchases_on_product_id"
    t.index ["purchase_id"], name: "index_item_purchases_on_purchase_id"
  end

  create_table "item_sales", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "amount", default: 0, null: false
    t.decimal "value", precision: 10, null: false
    t.decimal "total_value", precision: 10, null: false
    t.bigint "product_id"
    t.bigint "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_item_sales_on_product_id"
    t.index ["sale_id"], name: "index_item_sales_on_sale_id"
  end

  create_table "master_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_master_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_master_users_on_reset_password_token", unique: true
  end

  create_table "payment_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "kind", limit: 50, null: false
    t.string "description", limit: 100
    t.decimal "interest_rates", precision: 10, default: "0"
    t.integer "max_parcel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "kind", limit: 20, null: false
    t.string "name", limit: 100, default: ""
    t.string "company_name", limit: 200, default: ""
    t.string "person_rg", default: ""
    t.string "personC_ie", default: ""
    t.string "person_cpf", default: ""
    t.string "personC_cnpj", default: ""
    t.string "address", limit: 100, default: ""
    t.string "address_number", limit: 50, default: ""
    t.string "address_complement", limit: 100, default: ""
    t.string "address_bairro", limit: 100, default: ""
    t.bigint "address_zip", null: false
    t.string "address_city", limit: 100, null: false
    t.string "address_state", limit: 50, null: false
    t.bigint "person_tel1", null: false
    t.bigint "person_tel2"
    t.string "person_email", limit: 100, default: ""
    t.string "person_obs", limit: 200, default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "product_code", limit: 100, null: false
    t.string "description", limit: 100, null: false
    t.decimal "purchase_price", precision: 10, default: "0"
    t.decimal "sale_price", precision: 10, null: false
    t.decimal "profit_margin", precision: 10, default: "0"
    t.integer "stock"
    t.integer "stock_reserved", default: 0
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "providers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "provider_rasocial", limit: 100, null: false
    t.string "provider_ie"
    t.string "provider_cnpj", null: false
    t.string "provider_tel1", null: false
    t.string "provider_tel2"
    t.string "address", limit: 100, default: ""
    t.string "address_number", limit: 50, default: ""
    t.string "address_complement", limit: 100
    t.string "address_bairro"
    t.string "address_city", limit: 100, null: false
    t.string "address_state", limit: 50, null: false
    t.string "address_zip", null: false
    t.string "provider_email", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.decimal "total_value", precision: 10, null: false
    t.decimal "freight_value", precision: 10, default: "0"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_purchases_on_person_id"
  end

  create_table "sales", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.decimal "total_value", precision: 10, null: false
    t.decimal "discount_value", precision: 10, default: "0"
    t.string "state", limit: 20, default: "Aberta", null: false
    t.bigint "person_id"
    t.bigint "payment_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_type_id"], name: "index_sales_on_payment_type_id"
    t.index ["person_id"], name: "index_sales_on_person_id"
  end

  create_table "system_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["email"], name: "index_system_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_system_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_system_users_on_username", unique: true
  end

  add_foreign_key "accounts_payables", "purchases"
  add_foreign_key "accounts_payables", "system_users"
  add_foreign_key "accounts_receivables", "sales"
  add_foreign_key "budgets", "people"
  add_foreign_key "item_budgets", "budgets"
  add_foreign_key "item_budgets", "products"
  add_foreign_key "item_purchases", "products"
  add_foreign_key "item_purchases", "purchases"
  add_foreign_key "item_sales", "products"
  add_foreign_key "item_sales", "sales"
  add_foreign_key "products", "categories"
  add_foreign_key "purchases", "people"
  add_foreign_key "sales", "payment_types"
  add_foreign_key "sales", "people"
end
