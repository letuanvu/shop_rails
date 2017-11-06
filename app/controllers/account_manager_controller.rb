class AccountManagerController < ApplicationController
  def index
    @admin = Administrator.new
    @list = Account.getListAccount current_account['id']
  end

  def getDetailAccount
    @users = Administrator.find_by accounts_id: params[:id]
    render :json => { :result => true,:accounts => @users.as_json() }
  end

  def create
    # binding.pry
    if params[:administrator][:id] != ''
      #   update
      Administrator.update(params[:administrator][:id], :admin_name => params[:administrator][:admin_name])
      redirect_to :back
    else
      admin = Administrator.new(:accounts_id => params[:administrator][:accounts_id],:admin_name => params[:administrator][:admin_name])
      admin.save()
      redirect_to :back

    end
  end
end
