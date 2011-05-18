class UsersController < ApplicationController
  def index
    @users = User.all
    @garinim = Garin.order('name').all
  end

  def show
    @user = User.find(params[:id])
  end

  def notify
    @user = current_user
    if @user.notify?
      @user.update_attribute :notify, false
      redirect_to :back, :notice => "עוד תתחרטו על זה!"
    else
      @user.update_attribute :notify, true
      redirect_to :back, :notice => "מגניב, מעכשו אשתדל לזכור לשלוח לכם הודעה במייל כשמתפרסמת יצירה!"
    end
  end

end
