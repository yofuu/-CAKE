class Order < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: {
     "nyuukinnmachi":0, "nyuukinnkakuninn":1, "seisakuchuu":2, "hassouzyunnbichuu":3, "hassouzumi":4
  }
end