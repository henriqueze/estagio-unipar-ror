class AccountsPayable < ApplicationRecord
  belongs_to :purchase, optional: true
  belongs_to :provider, optional: true

end
