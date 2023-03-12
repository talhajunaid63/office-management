# frozen_string_literal: true

class AddCompanyReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :company, null: false, index: true
  end
end
