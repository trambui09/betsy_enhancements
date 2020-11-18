class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :merchant
  has_many :order_items
  has_many :orders, through: :order_items


  validates :name, presence: true
  # price must be present, a num, and greater than 0
  validates :price, presence: true, numericality: { greater_than: 0 ,
                                                    message: "price must be greater than 0"}
end
