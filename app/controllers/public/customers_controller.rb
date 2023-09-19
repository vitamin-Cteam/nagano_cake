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
      redirect_to customer_path
    else
      @customer = current_member
      flash.now[:notice] = "会員情報の変更に失敗しました"
      render :edit
    end
  end

  def confirm
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
