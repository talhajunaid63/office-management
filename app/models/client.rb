# == Schema Information
#
# Table name: clients
#
#  id           :bigint           not null, primary key
#  email        :string
#  github_url   :string
#  name         :string
#  phone_number :string
#  website      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint           not null
#
# Indexes
#
#  index_clients_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class Client < ApplicationRecord
  belongs_to :company

  validates_presence_of :name, :email, :website, :github_url
end
