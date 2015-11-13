class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]
  has_one :user_profile
  accepts_nested_attributes_for :user_profile, allow_destroy: true
  validates_format_of :username, with: /[a-zA-Z0-9_\.]/
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false } # etc.
  validates_uniqueness_of :username
  attr_accessor :login

  scope :get_active, -> { where(active: true) }
  scope :get_users, -> {where(admin: false)}

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

end