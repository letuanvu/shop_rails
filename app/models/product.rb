class Product < ApplicationRecord

  def self.getWId id
    return Product.select("id,name,price").from("products").where("id in (?)",id)
  end
end
