json.array!(@user_catalogs) do |user_catalog|
  json.extract! user_catalog, :id, :username, :firstname, :lastname, :email, :age, :favoritebook
  json.url user_catalog_url(user_catalog, format: :json)
end
