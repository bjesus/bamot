class Notifications < ActionMailer::Base
  default :from => "הדוור הטוב <bjesus@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.creation.subject
  #
  def creation(creation)
    @creation = creation
    @url = creation_url(@creation)
    @to = Array.new
    for user in User.find_all_by_notify true
      @to << user.email
    end
    mail :to => @to, :subject => "יצירה חדשה של "+@creation.user.fullname
  end

  def comment(creation, current_user, content)
    @creation = creation
    @user = current_user
    @content = content
    mail :from => @user.email, :to => @creation.user.email, :subject => "קבלת תגובה בדוור הטוב"
  end

end
