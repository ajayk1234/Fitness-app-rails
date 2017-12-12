json.extract! user, :id, :name, :password_digest, :joining_date, :contact_no, :created_at, :updated_at
json.url user_url(user, format: :json)
