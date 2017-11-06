class DashboardController < ApplicationController
  def index
     @sess = account_signed_in?

  end
end
