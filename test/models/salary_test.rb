# == Schema Information
#
# Table name: salaries
#
#  id          :bigint           not null, primary key
#  bonus       :float
#  gross_total :float
#  month       :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_salaries_on_company_id  (company_id)
#  index_salaries_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class SalaryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
