class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  def show
    @weight = order_weight
    @qty = item_qty 
    @l = 10
    @w = @qty*5
    @h = 5
    package_details
    raise
  end
 
private
 
  def order_weight                                  
    weight = 0                                      
    current_order.items.each do |item|         
      id = item.product_id                          
      wt = Product.find(id).weight                  
      qty = item.quantity                           
      weight += wt*qty                              
    end                                             
    weight                                          
  end                                               
                                                  
  def item_qty                                      
    quantity = 0                                    
    current_order.items.each do |item|             
      quantity += item.quantity                     
    end                                             
    quantity                                        
  end                                               

  def package_details
    response = HTTParty.get(
      'http://ship-ship.herokuapp.com/ship/package', :body =>
      {:weight => @weight,
       :length => @l
       :height => @h,
       :width => @w,
       :country => 'US'
       :state => current_order.address.state
       :city => current_order.address.city
       :zip => current_order.address.postal_code
      }
    )
    response
end
