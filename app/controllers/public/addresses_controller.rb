class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer, only: [:edit, :update, :destroy]

  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to request.referer, notice: '配送先を追加しました'
    else
      @addresses = Address.page(params[:page])
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: '配送先を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer, notice: '配送先を削除しました'
  end

  private
  def address_params
      params.require(:address).permit(:postal_code, :address, :name)
  end

  def is_matching_login_customer
    address = Address.find(params[:id])
    customer = address.customer
    unless customer.id == current_customer.id
      redirect_to addresses_path
    end
  end

end
