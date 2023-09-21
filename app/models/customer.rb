class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders,     dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses,  dependent: :destroy

  validates :last_name,         presence: true, length: {maximum: 20}
  validates :last_name_kana,    presence: true, length: {maximum: 20}, format: { with: /\A[\p{katakana}\u{30fc}]+\z/ }
  validates :first_name,        presence: true, length: {maximum: 20}
  validates :first_name_kana,   presence: true, length: {maximum: 20}, format: { with: /\A[\p{katakana}\u{30fc}]+\z/ }

  validates :email,             presence: true, uniqueness: true
  validates :postal_code,       presence: true, length: {is: 7},  numericality: {only_integer: true}
  validates :address,           presence: true, length: {maximum: 50}
  validates :telephone_number,  presence: true, length: {in: 10..11}, numericality: {only_integer: true}
end
