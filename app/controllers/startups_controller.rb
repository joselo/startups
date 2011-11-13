class StartupsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    @startups = current_user.startups
  end

  def show
    @startup = current_user.find_startup(params[:id])
  end

  def new
    @startup = current_user.new_startup
  end

  def edit
    @startup = current_user.find_startup(params[:id])
  end

  def create
    @startup = current_user.new_startup(params[:startup])
    if @startup.save
      redirect_to [:me, @startup], notice: I18n.t('startups.create.created')
    else
      render :new
    end
  end

  def update
    @startup = current_user.find_startup(params[:id])

    if @startup.update_attributes(params[:startup])
      redirect_to [:me, @startup], notice: I18n.t('startups.update.updated')
    else
      render :edit
    end
  end

  def destroy
    @startup = current_user.find_startup(params[:id])
    @startup.destroy

    redirect_to me_startups_path, notice: I18n.t('startups.destroy.destroyed')
  end
end