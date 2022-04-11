class Review < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  enum age: { twenties: 0, thirties: 1, forties: 2, fifties: 3 }
  enum figure: { 普通: 0, ふくよか: 1, ほっそり: 2 }

  validates :age, presence: true
  validates :height, presence: true
  validates :figure, presence: true
  validates :comment, presence: true

end
