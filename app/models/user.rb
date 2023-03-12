# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  company_joining_date   :string
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  job_position           :string
#  job_type               :string
#  joining_date           :date
#  last_name              :string
#  leaving_date           :date
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  salary                 :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :bigint           not null
#
# Indexes
#
#  index_users_on_company_id            (company_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_person_name

  belongs_to :company

  validates_presence_of :first_name, :last_name, :email, :job_position, :job_type, :joining_date, :salary
  validates :salary, numericality: { greater_than: 0 }
  validates :email, uniqueness: { scope: :company_id }

  enum job_positions: {
    ceo: 'ceo',
    cto: 'cto',
    jr_software_engineer: 'jr_software_engineer',
    sr_software_engineer: 'sr_software_engineer',
    jr_qa: 'qa',
    sr_qa: 'sr_qa',
    hr: 'hr'
  }

  enum job_types: {
    full_time: 'full_time',
    part_time: 'part_time',
    contract: 'contract',
    internship: 'internship',
    fixed_term: 'fixed_term'
  }
end
