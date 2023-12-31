class Address < ApplicationRecord

  belongs_to :customer

  validates :customer_id, presence: true
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :name, presence: true

end
