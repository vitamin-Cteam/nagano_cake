class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
    @order_details = @order.order_details
  end

  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.all
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(production_status: 1) if @order.status == "confirm"
      #注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

end
