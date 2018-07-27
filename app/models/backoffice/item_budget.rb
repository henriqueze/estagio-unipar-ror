class Backoffice::ItemBudget < ApplicationRecord
  belongs_to :product
  belongs_to :budget
end
