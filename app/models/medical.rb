class Medical < ApplicationRecord
	belongs_to :pet

	validates_presence_of :date, :title
end
