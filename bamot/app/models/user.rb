class User < ActiveRecord::Base
  has_many :creations
  belongs_to :garin
  validates_presence_of :firstname, :lastname, :garin_id, :phone

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :garin_id, :phone, :email, :password, :password_confirmation, :remember_me
end
