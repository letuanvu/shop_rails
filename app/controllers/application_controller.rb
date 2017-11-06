class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_account!
  before_action :rec

  def rec
    if current_account
      isAdmin = Administrator.find_by accounts_id: current_account['id']
      unless isAdmin
      #   nếu không phải là admin thì chuyển về trang khác

      # if request.method != 'delete' #&& request.path == '/auth/'
      redirect_to shop_path

      end

      @name = current_account['email']
      @createat = current_account['created_at']
    end

  end


end
