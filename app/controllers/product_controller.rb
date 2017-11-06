class ProductController < ApplicationController
  def index
    @list = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    # binding.pry
    # return render :text => "hello", :status => 520
    product = Product.new(:name => params[:product][:name], :price => params[:product][:price])
    # binding.pry

    product.save
    redirect_to product_list_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to product_list_path
  end

  def edit
    @pro = Product.find(params[:id])
  end

  def update
    @prod = Product.find(params[:id])
    if @prod.update(:name => params[:product][:name], :price => params[:product][:price])
      redirect_to product_list_path
    else
      render :edit
    end
  end

end
