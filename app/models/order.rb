class Order < ApplicationRecord
  def self.getList
    res = Order.select("orders.*, customers.customerName").joins("LEFT JOIN customers ON customers.id = orders.customers_id")
    return res
  end

  def self.getListByIdCus id
    res = Order.select("orders.*, customers.customerName").joins("LEFT JOIN customers ON customers.id = orders.customers_id").where("orders.customers_id=?",id)
    return res
  end

  def self.getDetail idOrder
    return Order.select("orders.id as orderId, customers.customerName, order_products.unit_price, products.*")
      .from("orders")
      .joins("INNER JOIN customers ON customers.id = orders.customers_id")
      .joins("INNER JOIN order_products ON order_products.orders_id = orders.id")
      .joins("INNER JOIN products ON products.id = order_products.products_id")
      .where("orders.id = '#{idOrder}'")
  end

  def self.getShipInfo idOrder
    return Order.select("shipping_infos.*")
      .from("orders")
      .joins("LEFT JOIN shipping_infos ON shipping_infos.id = orders.shipping_infos_id")
      .where("orders.id = '#{idOrder}'")
  end


end
