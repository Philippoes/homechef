json.status 'success'
json.order_items @order_items.each do |item|
  json.name item.item.name
  json.price item.item.price
  json.quantity item.quantity
  json.ready_time item.item.ready_time.to_formatted_s(:short)
end
json.total @total_amount