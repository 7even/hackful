# == Schema Information
#
# Table name: notifications
#
#  id             :integer         not null, primary key
#  user_id        :integer
#  unread         :boolean         default(TRUE)
#  alerted_id     :integer
#  alerted_type   :string(255)
#  alertable_id   :integer
#  alertable_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Notification < ActiveRecord::Base
	belongs_to :alerted, :polymorphic => true
	belongs_to :alertable, :polymorphic => true
	
	attr_accessible :alertable_type, :alertable_id, :user_id, :alerted_type, :alerted_id
end
