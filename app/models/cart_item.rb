class CartItem < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable

  has_one_attached :image
  belongs_to :item
  belongs_to :customer


  def subtotal
    item.with_tax_price * amount
  end

end
