# == Schema Information
#
# Table name: data_sets
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  contact_me :boolean         default(TRUE)
#  twitter    :string(255)
#  github     :string(255)
#  linkedin   :string(255)
#  url        :string(255)
#  blog       :string(255)
#  about_me   :text
#  created_at :datetime
#  updated_at :datetime
#

class DataSet < ActiveRecord::Base
	#Initial table structure, could be changed in favor of more dynamic structure

	attr_accessible :contact_me, :user_id

	belongs_to :user
end
