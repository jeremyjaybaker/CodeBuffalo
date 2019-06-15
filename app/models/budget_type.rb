class BudgetType < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
