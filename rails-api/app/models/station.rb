class Station < ApplicationRecord
	has_and_belongs_to_many :factories
end
