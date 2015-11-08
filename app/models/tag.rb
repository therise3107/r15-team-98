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
	before_create :small_words
	
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

	validates_uniqueness_of :name, :message => "already present"
	validates :name, length: { in: 1..20 }
	has_many :notes 
	has_many :users, through: :notes

	

	def small_words
		self.name.downcase!
	end

end
