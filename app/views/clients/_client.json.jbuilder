json.extract! client, :id, :name, :email, :phone_number, :website, :github_url, :company_id, :created_at, :updated_at
json.url client_url(client, format: :json)
