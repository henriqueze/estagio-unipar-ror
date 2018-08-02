class AccountsReceivable < ApplicationRecord
  belongs_to :sale
  belongs_to :payment_type

end
