json.extract! user, :id, :login, :password, :name, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
