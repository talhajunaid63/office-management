# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  domain_name :string           not null
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_companies_on_domain_name  (domain_name) UNIQUE
#
class Company < ApplicationRecord
  has_many :users
  has_many :salaries
  has_many :expenses

  validates_presence_of :name, :domain_name
  validates_uniqueness_of :domain_name
end
