class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
  end

  private
  def address_params
      params.require(:address).permit(:postal_code, :address, :name)
  end

end
