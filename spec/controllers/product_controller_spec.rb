require 'rails_helper'

RSpec.describe ProductController, type: :controller do
  login_user
  logout

  describe "GET #index" do
    it "return success" do #example
      get :index
      # binding.pry
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "create product" do
      # binding.pry
      post :create, :params => {:product => {:name => "My Widget", :price => 20}}
      # expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(product_list_path)
      # binding.pry
    end
  end

  describe "GET #edit" do
    it "get edit" do
      # binding.pry
      product = Product.new(:name => "My Widget", :price => 20)
      product.save
      get :edit, {:id => product.id}
      expect(response).to have_http_status(:success)

      # binding.pry
    end
  end

  describe ""

end
