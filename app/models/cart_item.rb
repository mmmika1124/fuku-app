class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :item_id, presence: true
  validates :customer_id, presence: true
  validates :amount, presence: true

end
