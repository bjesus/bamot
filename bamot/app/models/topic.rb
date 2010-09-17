class Topic < ActiveRecord::Base
  has_many :creations
  has_friendly_id :name, :use_slug => true
end
