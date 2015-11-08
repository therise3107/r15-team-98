class Tag < ActiveRecord::Base
	include AlgoliaSearch
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged
	
	algoliasearch do
		attribute :name, :id
	end

	def slug_candidates
		[
			:name,
			[:name, :id]
		]
	end
end
