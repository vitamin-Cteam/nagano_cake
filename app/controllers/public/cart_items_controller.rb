class Public::CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_customer.cart_items.includes([:item])
  end

  def update
    cart_item = current_customer.cart_items.find_by(:item_id)
    cart_item.update(amount: cart_item_params.amount)
  end

  def destroy
    cart_item = current_customer.cart_items.find_by(:item_id)
    cart_item.destroy
  end

  def destroy_all
    current_customer.cart_items.destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    cart_item = current_customer.cart_items.find_by(:item_id)
    if @cart_item.item.is_on_sale == true
      if cart_item
        amount = current_customer.cart_items.amount + cart_item_params.amount.to_i
        @cart_item.update(amount: amount)
      else
        @cart_item.save
      end
    end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
