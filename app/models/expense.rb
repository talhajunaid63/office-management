# == Schema Information
#
# Table name: expenses
#
#  id           :bigint           not null, primary key
#  amount       :float
#  comments     :text
#  date         :date
#  expense_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint           not null
#
# Indexes
#
#  index_expenses_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class Expense < ApplicationRecord
  belongs_to :company

  validates_presence_of :date, :amount, :expense_type

  enum expense_types: {
    office_rent: 'office_rent',
    internet_bill: 'internet_bill',
    electricity_bill: 'electricity_bill',
    water_bill: 'water_bill',
    cleaning_bill: 'cleaning_bill',
    other: 'other'
  }
end
