class AddressesController < ApplicationController
  def create
    @address = current_order.build_address(params.require(:address).permit!)
    if @address.save
      redirect_to cart_path
    end
  end

  def destroy
    address = Address.find(current_order.address.id)
    address.destroy
    redirect_to cart_path
  end

end
