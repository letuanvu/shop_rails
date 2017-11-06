class FrontController < ActionController::Base
  protect_from_forgery with: :exception
  layout "front"
  def index
    if current_account
      @user = current_account['email']
    end

    @list = Product.all
  end

  def getCart
    id = []
    params[:rawCart].each do |i,v|
      id.push(v['id'].to_i)
    end
    @listP = Product.getWId id
    render :json => { :result => true,:infor => @listP.as_json() }
  end

  def cart
    if current_account
      @user = current_account['email']
      unless Customer.find_by accounts_id: current_account['id']
        redirect_to information_path
      end
    else
      redirect_to new_account_session_path
    end
  end

  def information
    if current_account
      @user = current_account['email']
      @idAcc = current_account['id']
      cuss = Customer.find_by accounts_id: @idAcc
      unless cuss
        @cusstomer = Customer.new
      else
        @cusstomer = cuss
      end
    else
      redirect_to new_account_session_path
    end
  end

  def create
    # binding.pry
    customer = Customer.new(:customerName => params[:customer][:customerName], :creditCardInfo => params[:customer][:creditCardInfo], :address => params[:customer][:address], :accounts_id => params[:customer][:accounts_id] )
    if customer.save
      redirect_to cart_path
    end

  end

  def update
    cuss = Customer.find_by accounts_id: current_account['id']
    if cuss.update(:customerName => params[:customer][:customerName], :creditCardInfo => params[:customer][:creditCardInfo], :address => params[:customer][:address], :accounts_id => params[:customer][:accounts_id] )
      redirect_to information_path
    end
  end

  def createorder
    # binding.pry
    ship_info = ShippingInfo.new(:shipping_type => params["shiping_info"]["shiping_type"],:shipping_region_id => params["shiping_info"]["adress"],:shipping_cost => params["shiping_info"]["shiping_cost"] )
    ship_info.save
    ship_id = ship_info.id

    order_info = Order.new(:orderStatus=>"pending", :shipping_infos_id=>ship_id, :customers_id=>current_account['id'])
    order_info.save
    order_id = order_info.id

    params['order_product'].each do |i,v|
      detail = OrderProduct.new(:unit_price=>v["num"],:products_id=>v["id"],:orders_id=>order_id)
      detail.save
    end

    render :json => { :result => true}
  end

  def my_order
    @user = current_account['email']
    @list = Order.getListByIdCus current_account['id']
  end

  def changeStatus
    @order = Order.find_by id: params[:id]
    if @order['orderStatus'] == 'pending'
      @order.update(:orderStatus => 'Cancel')
    end
    redirect_to shop_order_path
  end

end
