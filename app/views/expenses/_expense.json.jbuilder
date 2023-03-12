json.extract! expense, :id, :expense_type, :company_id, :commens, :created_at, :updated_at
json.url expense_url(expense, format: :json)
