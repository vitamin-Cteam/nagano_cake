class Admin::CustomersController < ApplicationController
  before_action :get_customer_id, only: [:show, :edit, :update] #下記記載のget_customer_idアクションが指定のアクションに適用

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

  def get_customer_id
    @customer = Customer.find(params[:id])
  end
end
