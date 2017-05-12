class Order < ApplicationRecord
	has_many :waybills
	has_many :items	
	attr_accessor :waybills, :items
end
