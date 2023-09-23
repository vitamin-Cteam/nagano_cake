class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = OrderDetail.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.production_status == "making"
      # 製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する
      # 紐付いている注文商品の製作ステータスが "すべて" [製作完了]になった際に注文ステータスを「発送準備中」に更新させたいため
      @order_details.each do |order_detail| #紐付いている注文商品の製作ステータスを一つ一つeach文で確認
        if order_detail.production_status != "complete" # 製作ステータスが「製作完了」ではない場合
          is_updated = false # 上記で定義してあるis_updatedを「false」に変更する
        end
      end
      @order.update(status: 3) if is_updated
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新され上記のif文でis_updatedがfalseになっている場合、更新されない
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
