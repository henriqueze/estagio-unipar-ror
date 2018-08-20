class SystemUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :validatable,
          authentication_keys: [:login]

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  #validate :validate_username

  #verificar a lógica desse metodo
	# def validate_username
	#   if MasterUser.where(email: username).exists?
	#     errors.add(:username, :invalid)
	#   end
	# end

  attr_writer :login

  attr_accessor :username

  def login
  	@login || self.username
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["(username) = :value OR (email) = :value", { :value => login.downcase }]).first
  else
    if conditions[:username].nil?
      where(conditions).first
    else
      where(username: conditions[:username]).first
    end
  end
end
end
