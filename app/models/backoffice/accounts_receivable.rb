class Backoffice::AccountsReceivable < ApplicationRecord
  belongs_to :sales
  belongs_to :payment_type
  belongs_to :system_user
end
