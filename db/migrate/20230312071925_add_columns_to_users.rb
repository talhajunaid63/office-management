class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :joining_date, :date
    add_column :users, :leaving_date, :date
  end
end
