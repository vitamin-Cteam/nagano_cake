class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to customers_information_path
    else
      @customer = current_customer
      render :edit
    end
  end

  def confirm
  end

  def withdraw
    @customer = current_customer
    # is_activeカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_active: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,
                                     :first_name,
                                     :last_name_kana,
                                     :first_name_kana,
                                     :postal_code,
                                     :address,
                                     :telephone_number,
                                     :email
                                     )
  end
end
