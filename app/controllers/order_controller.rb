class OrderController < ApplicationController
  skip_before_action :rec, only: [:getDetailOrder]

  def index
    @list = Order.getList

  end

  def getDetailOrder
    @order = Order.getDetail params[:id]
    @ship_info = Order.getShipInfo params[:id]
    render :json => { :result => true,:order => @order.as_json(),:ship => @ship_info }
  end

  def changeStatus
    @order = Order.find_by id: params[:id]
    if @order['orderStatus'] == 'pending'
      @order.update(:orderStatus => 'Processed')
    else
      @order.update(:orderStatus => 'pending')
    end
    redirect_to order_list_path
  end
end
