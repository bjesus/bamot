class HomeController < ApplicationController
  def index
    @user = current_user
    @creations = Creation.order("created_at DESC").limit(5)
    @users = User.order("created_at DESC").limit(5)
    @news = Creation.where('news'=>true).order("created_at DESC").limit(2)
    ids = Creation.find( :all, :select => 'id' ).map( &:id )
    @gallery = Creation.find( (1..4).map { ids.delete_at( ids.size * rand ) } )
  end

end
