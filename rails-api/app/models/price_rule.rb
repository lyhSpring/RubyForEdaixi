class PriceRule < ApplicationRecord
	def self.deleteByCategoryId(region_id)
		delete_all("region_id=?","#{region_id}")
	end
end
