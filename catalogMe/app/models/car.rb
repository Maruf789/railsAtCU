class Car < Vehicle
  include Mongoid::Document
  embedded_in :moveable, polymorphic: true
end

