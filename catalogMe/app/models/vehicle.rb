class Vehicle
  include Mongoid::Document
  embeds_many :vehicles, as: :moveable

  field :manufacturer, type: String
  field :model, type: String
  field :speed, type: Integer
  field :price, type: Float

end