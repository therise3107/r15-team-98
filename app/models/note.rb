# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_id     :integer
#

class Note < ActiveRecord::Base
	belongs_to :user
	belongs_to :tag
end
