class UsersController < ApplicationController
  def index
    @users = User.all
    @garinim = Garin.order('name').all
  end

  def show
    @user = User.find(params[:id])
  end

end
