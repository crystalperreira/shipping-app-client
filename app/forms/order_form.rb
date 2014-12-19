class OrderForm
  attr_accessor :order

  def initialize(order, params)
    @order = order
    #add something that saves the shipping method and the cost of that method
    @order.build_credit_card(params.require(:credit_card).permit!)
    x = Order.find(@order.id)
    shipping_cents = params[:selection].gsub(/\D/, '')
    ship_method = params[:selection].gsub(/\d/, '')[0..-2]
    x.totalamt = order.total.cents + shipping_cents.to_i
    x.shipmethod = ship_method
    x.save 
    raise
  end

  def save
    @order.save
  end

end
