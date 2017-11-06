require 'rails_helper'


RSpec.describe "create acc", :type => :request do
  it "create account" do
    puts get "/auth/register/cmon_let_me_in"
    # puts assert_select "form.new_account"
    # puts assert_select "input[id=account_email]"

    # assert_select "form.new_account" do
    #   assert_select "input[id=account_email]"
    #   assert_select "input[id=account_password]"
    #   assert_select "input[id=account_password_confirmation]"
    #   assert_select "input[type=submit]"
    # end
    #
    post "/auth/register", {:account => {:email=> "ltvu.599@gmail.com", :password => "letuanvu111", :password_confirmation => "letuanvu111"}}
    # assert_select ".header .email", :text => "ltvu.599@gmail.com"

  end
end

# RSpec.describe "home page", :type => :request do
#   it "displays the user's username after successful login" do
#     get "/auth/login"
#     assert_select "form.login" do
#       assert_select "input[name=?]", "account[email]"
#       assert_select "input[name=?]", "account[password]"
#       assert_select "input[type=?]", "commit"
#     end
#
#     post "/auth/login", :account[email] => "ltvu.599@gmail.com", :account[password] => "secret"
#     assert_select ".header .email", :text => "ltvu.599@gmail.com"
#   end
# end