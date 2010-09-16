class Garin < ActiveRecord::Base
  belongs_to :grade
  has_many :users
end
