class User < ActiveRecord::Base
  has_many :creations
  belongs_to :garin
  validates_presence_of :firstname, :lastname, :garin_id, :phone, :phoneext
  has_friendly_id :urlname, :use_slug => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :garin_id, :phone, :phoneext, :email, :password, :password_confirmation, :remember_me

  def display_name
    ' / <a href="/users/'+ urlname + '">' + fullname + '</a>'
  end

  def urlname
    firstname+lastname
  end

  def english
    (firstname+" "+lastname).to_url
  end

  def fullname
    firstname + " " + lastname
  end
end
