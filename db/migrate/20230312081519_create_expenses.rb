class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :expense_type
      t.references :company, null: false, foreign_key: true
      t.text :comments
      t.float :amount
      t.date :date

      t.timestamps
    end
  end
end
