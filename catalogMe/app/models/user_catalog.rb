class UserCatalog
  include Mongoid::Document
  field :username, type: String
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :age, type: Integer
  field :favoritebook, type: String
end
