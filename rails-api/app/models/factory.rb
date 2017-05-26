class Factory < ApplicationRecord
	has_one :address
	has_many :stations
end
