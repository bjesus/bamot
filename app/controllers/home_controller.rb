class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = current_user
    @creations = Creation.order("created_at DESC").limit(5)
    @users = User.order("created_at DESC").limit(4)
    @news = Creation.where('news'=>true).order("created_at DESC").limit(2)
    pids = Creation.where('image_file_name', 'topic_id'=>true).find( :all, :select => 'id' ).map( &:id )
    @photosgallery = Creation.find( (1..2).map { pids.delete_at( pids.size * rand ) } )
    tids = Creation.where('image_file_name'=>nil, 'topic_id'=>true).find( :all, :select => 'id' ).map( &:id )
    @textgallery = Creation.find( (1..2).map { tids.delete_at( tids.size * rand ) } )
    @topic = Topic.first(:conditions => 'start>'+'2010-09-17')
    rids = Creation.find( :all, :select => 'id' ).map( &:id )
    @random = Creation.find( (1..5).map { rids.delete_at( rids.size * rand ) } )
    @kinds = Kind.all
 end

  def about
  end

  def search
  end

  def news
    @news = Creation.where('news'=>true).order("created_at DESC").limit(20)
  end
end
