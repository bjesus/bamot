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
end
