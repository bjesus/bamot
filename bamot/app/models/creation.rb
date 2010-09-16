class Creation < ActiveRecord::Base
  belongs_to :kind
  belongs_to :topic
  belongs_to :user
  has_many :extfiles
  validates_presence_of :kind_id, :name, :user_id
end
