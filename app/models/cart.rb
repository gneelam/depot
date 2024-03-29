class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, :dependent => :destroy
  def add_product(product_id)
  	current_item = line_items.find_by_product_id(product_id)
  		if current_item
  			current_item.quantity += 1
  		else
  			current_item = line_items.build(:product_id => product_id)
  		end
  		current_item
  end
  def decrement_line_item_quantity(line_item_id)
    current_item = line_items.find(line_item_id)
     logger.debug "quantity before : #{current_item.quantity}"
      current_item.quantity -= 1
     logger.debug "quantity after : #{current_item.quantity}"
     current_item.save
      current_item
  end
def total_price
    line_items.to_a.sum{ |item| item.total_price}
  end
def total_item
    line_items.sum(:quantity)
  end  
end
