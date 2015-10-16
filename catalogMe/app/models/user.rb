class User
  include Mongoid::Document
  include ActiveModel::SecurePassword 
  include ActiveModel::Validations    
  has_many :vehicles, :dependent => :destroy
  before_validation :normalize_names, on: :create

    field :first_name, type: String
    field :last_name, type: String
    field :email, type: String
    field :age, type: Integer
    field :password_digest, type: String
    has_secure_password

   protected
    def normalize_names
      self.first_name = first_name.downcase.titleize
    end
   
    validates_presence_of :first_name, :last_name, :email
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :first_name, :presence => {:message => "You must provide your first name."}
    validates :last_name, :presence => {:message => "You must provide your last name."}
    validates :email, presence: true
    validates_numericality_of :age, :only_integer => true, 
                              :greater_than_or_equal_to => 1, 
                              :message => "can only be whole number between 1 and 125."
    validates :password, length: { minimum: 3, maximum: 16 }

end




=begin   # these fields below are from HW #4. So they are depricated/commented out for HW #5.
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
=end