class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end
