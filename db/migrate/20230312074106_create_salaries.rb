class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :bonus
      t.float :gross_total
      t.date :month

      t.timestamps
    end
  end
end
