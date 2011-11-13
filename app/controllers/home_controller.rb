class HomeController < ApplicationController
  def index
    @startups = Startup.latest(params[:page])
  end

  def show
    @startup = Startup.find(params[:id])
  end
end