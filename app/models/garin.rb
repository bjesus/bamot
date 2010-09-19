class Garin < ActiveRecord::Base
  belongs_to :grade
  has_many :users
  has_friendly_id :name, :use_slug => true
end
