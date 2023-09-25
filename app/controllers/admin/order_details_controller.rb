class Admin::OrderDetailsController < ApplicationController

  def update
    @order_details = OrderDetail.find(params[:id])
    @order = @order_details.order

    if @order_details.update(order_details_params)
      if @order.order_details.any? { |order_details| order_details.production_status == "producting" }
        @order.update(status: 2) #製作ステータスが製作中になったら注文ステータスも製作中
      elsif @order.order_details.all? { |order_details| order_details.production_status == "complete" }
        @order.update(status: 3) #製作ステータスがすべて製作完了になったら注文ステータスは発送準備中
      end
      redirect_to request.referer
    end
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:production_status)
  end

end
