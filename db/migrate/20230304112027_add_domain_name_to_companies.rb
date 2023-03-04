class AddDomainNameToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :domain_name, :string, null: false
    add_index :companies, :domain_name, unique: true
  end
end
