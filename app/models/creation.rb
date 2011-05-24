class Creation < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
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

  def urlname
    name.to_url
  end
  
  def forward(context=nil)
    pool = case context
      when 'topic' then self.topic.creations.order("created_at").split self
      when 'kind' then self.kind.creations.order("created_at").split self
      when 'user' then self.user.creations.order("created_at").split self
      else Creation.order("created_at").all.split self
    end
    @creation = pool[1][0]
  end

  def backward(context=nil)
    pool = case context
      when 'topic' then self.topic.creations.order("created_at").split self
      when 'kind' then self.kind.creations.order("created_at").split self
      when 'user' then self.user.creations.order("created_at").split self
      else Creation.order("created_at").all.split self
    end
    @creation = pool[0][-1]
  end
  
end
