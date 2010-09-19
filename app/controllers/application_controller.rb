class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin
    unless current_user.email=="bjesus@gmail.com"
      #You don't belong here. Go away.
      flash[:notice] = "YOU SHOULDN'T BE HERE"
      redirect_to "/"
    end
  end

  def authorise
    unless @post.user == current_user || current_user.email=="bjesus@gmail.com"
      #You don't belong here. Go away.
      flash[:notice] = "ACCESS DENIED"
      redirect_to "/"
    end
  end

  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = 'he'
  end

end
