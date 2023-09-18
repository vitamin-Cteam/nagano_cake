class Customer < ApplicationRecord
  has_many :order, dependent: :destroy
  has_many :cart_item, dependent: :destroy
  has_many :address, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
