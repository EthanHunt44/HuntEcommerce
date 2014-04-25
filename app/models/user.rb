class User < ActiveRecord::Base
  rolify

  after_create :add_default_role

  ROLES= [:admin , :seller, :buyer]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body


  def add_default_role
     add_role(:buyer) if self.roles.blank?
  end

end
