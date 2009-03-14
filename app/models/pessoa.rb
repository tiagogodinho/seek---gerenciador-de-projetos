class Pessoa < ActiveRecord::Base
	has_many :participantes
	has_many :projetos, :through => :participantes
	
	include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_presence_of     :Login
  validates_length_of       :Login,    :within => 3..40
  validates_uniqueness_of   :Login
  validates_format_of       :Login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  #validates_format_of       :Nome,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  #validates_length_of       :Nome,     :maximum => 100

  validates_presence_of     :Email
  validates_length_of       :Email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :Email
  validates_format_of       :Email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
  
  validates_presence_of     :password
  validates_presence_of     :password_confirmation

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :Login, :Email, :Nome, :password, :password_confirmation



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_Login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :Login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :Email, (value ? value.downcase : nil)
  end

  protected

end