# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  user_id    :integer
#
# Indexes
#
#  index_tags_on_slug  (slug) UNIQUE
#

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

	has_many :notes 

end
