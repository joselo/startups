class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to me_profile_path, :notice => I18n.t('users.update.updated')
    else
      render :edit
    end
  end

end