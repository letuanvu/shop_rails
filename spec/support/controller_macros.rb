module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  #   end
  # end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = Account.create({email: 'test_account@edumall.vn',password: '12345678'})
      admin = Administrator.new(:admin_name => 'vu', :accounts_id => user.id)
      # binding.pry

      admin.save
      # binding.pry
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end

  def logout
    after :each do
      if Administrator.delete_all
        Account.delete_all "email = 'test_account@edumall.vn'"
      end
    end
  end


end