class HomeController < ApplicationController
  def index
    @user = current_user
    @creations = Creation.order("created_at DESC").limit(5)
    @users = User.order("created_at DESC").limit(5)
    @news = Creation.where('news'=>true).order("created_at DESC").limit(2)
    pids = Creation.where('image_file_name', 'topic_id'=>true).find( :all, :select => 'id' ).map( &:id )
    @photosgallery = Creation.find( (1..2).map { pids.delete_at( pids.size * rand ) } )
    tids = Creation.where('image_file_name'=>nil, 'topic_id'=>true).find( :all, :select => 'id' ).map( &:id )
    @textgallery = Creation.find( (1..2).map { tids.delete_at( tids.size * rand ) } )
  end

end
