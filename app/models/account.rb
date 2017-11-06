class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.getListAccount id
    res = Account.select('accounts.*,administrators.admin_name').joins("LEFT JOIN administrators ON administrators.accounts_id = accounts.id").where("accounts.id != '#{id}'")
    return res
  end
end
