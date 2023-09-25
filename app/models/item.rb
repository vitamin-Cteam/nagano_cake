class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :item_image
  validates :name, presence:true

  validates :description, presence:true

  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

    # 商品画像のサイズ調整
  def get_item_image(width, height)
    unless item_image.attached?
      # 商品画像がない場合はimages/no-image.jpgを参照
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end


  def with_tax_price
    (price * 1.1).floor
  end

end
