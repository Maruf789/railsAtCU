class User  #< ActiveRecord::Base
  include Mongoid::Document
  include SimpleEnum::Mongoid

  #field :first_name, type: String
  field :admin, :type => Boolean, :default => false
  field :name, type: String
  field :role, type: Integer

  ## Database authenticatable
  field :email,              :type => String, :default => "" 
  field :encrypted_password, :type => String, :default => "" 

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => DateTime

  ## Rememberable
  field :remember_created_at, :type => DateTime

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0 #, null: false
  field :current_sign_in_at, :type => DateTime
  field :last_sign_in_at,    :type => DateTime
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  field :created_at,   :type => DateTime
  field :updated_at,   :type => DateTime

  ## Token authenticatable
  #field :authentication_token, :type => String


  #as_enum :role, [:admin, :member, :anon], :strings => true
  as_enum :role, [:user, :vip, :admin] #:strings => true

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #HACK FOR DEVISE 
  def self.serialize_into_session(record)
      [record.id.to_s, record.authenticatable_salt]
  end

end