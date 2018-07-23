class AccountsPayable < ApplicationRecord
  belongs_to :purchase
  belongs_to :system_user
end
