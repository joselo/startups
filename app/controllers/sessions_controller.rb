class SessionsController < ApplicationController
  def new
    redirect_to '/auth/twitter'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    if !user.email
      flash[:warning] = I18n.t('sessions.create.please_enter_your_mail')
      redirect_to me_edit_path(user)
    else
      redirect_to root_url, :notice => I18n.t('sessions.create.signed_in')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => I18n.t('sessions.destroy.signed_out')
  end

  def failure
    flash[:error] = I18n.t("sessions.failure.authentication_error", :error => "#{params[:message].humanize}")
    redirect_to root_url
  end

end
