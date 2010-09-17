class Creation < ActiveRecord::Base
  belongs_to :kind
  belongs_to :topic
  belongs_to :user
  has_many :extfiles
  validates_presence_of :kind_id, :name, :user_id
  has_attached_file :image,
  :styles => {
    :little => "100x100#",
    :medium  => "200x200>",
    :large => "800x800" }
  acts_as_taggable
end
