class Product < ActiveRecord::Base
has_many :line_items
before_destroy :ensure_not_referenced_with_any_line_items
validates_presence_of :name, :price, :description
validates :price , numericality: {greater_than_or_equal_to: 0.01}
	def ensure_not_referenced_with_any_line_items
		if line_items.empty?
			return true
		else
			errors.add(:base, "line item present")
			return false
		end	
		
	end
	def self.latest
		Product.order(:updated_at).last
		
	end

end
