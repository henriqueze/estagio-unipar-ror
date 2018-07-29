class Backoffice::DashboardController < ApplicationController
	before_action :authenticate_master_user!

	layout "backoffice"

  def index
  end
end
