class Cart < ActiveRecord::Base
has_many :line_items, :dependent => :destroy
	def add_product(product_id)
		
	 	currrent_item = line_items.find_by(product_id: product_id)
		if currrent_item	 	
			currrent_item.quantity += 1 
		else
			currrent_item = line_items.build(product_id: product_id)
		end
		currrent_item

	end
end
