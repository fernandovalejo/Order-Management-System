module OrdersHelper
  def concluded(order)
    order.status_id == 3 
  end
  
  def status(order)
    badge = 'info' if order.status_id == 1
    badge = 'warning' if order.status_id == 2
    badge = 'success' if order.status_id == 3
    
    "<span class='text-white badge badge-#{badge}'>#{order.status}</span>"
  end  
end