class Order < ApplicationRecord
  has_many :order_items
  has_many :products, through: :order_items
  validates :name, :email, :address, :credit_card_num, :exp_data, :cvv, :zip_code,  presence: true
  validates :cvv , :credit_card_num, numericality: { only_integer: true }
  validates :cvv, length: { is: 3 }
  validates :credit_card_num, length: { is: 16 }

end
