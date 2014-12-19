class OrderForm
  attr_accessor :order

  def initialize(order, params)
    @order = order
    #add something that saves the shipping method and the cost of that method
    @order.build_credit_card(params.require(:credit_card).permit!)
  end

  def save
    @order.save
  end

end
