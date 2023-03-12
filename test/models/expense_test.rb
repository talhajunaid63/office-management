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
require "test_helper"

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
