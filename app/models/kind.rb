class Kind < ActiveRecord::Base
  has_many :creations
  has_friendly_id :name, :use_slug => true

  def fullname
    name+" - "+description
  end
end
