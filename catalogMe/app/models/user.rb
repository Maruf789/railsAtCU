class User
  include Mongoid::Document

  	field :active, type: String
  	field :vehicle_license_number, type: String
  	field :name, type: String
  	field :license_type, type: String
  	field :expiration_date, type: String
  	field :permit_license_number, type: String
  	field :dmv_license_plate_number, type: String
  	field :vehicle_vin_number, type: String
  	field :wheelchair_accessible, type: String
  	field :certification_date, type: String 
  	field :hack_up_date, type: String
  	field :vehicle_year, type: Integer
  	field :base_number, type: String
  	field :base_name, type: String
  	field :base_type, type: String
    field :veh, type: String
  	field :base_telephone_number, type: String
  	field :website, type: String
  	field :base_address, type: String
  	field :reason, type: String
  	field :order_date, type: String
  	field :last_date_updated, type: String
  	field :last_time_updated, type: String

end
