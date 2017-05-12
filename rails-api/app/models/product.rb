class Product < ApplicationRecord
	has_one :price
	def self.search(categories_id,page)
		order('updated_at').where('categories_id = ?',"#{categories_id}").paginate(page: page, per_page: 10)
	end
end
