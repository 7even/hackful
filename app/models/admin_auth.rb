# == Schema Information
#
# Table name: admin_auths
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  resource   :string(255)
#  action     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AdminAuth < ActiveRecord::Base
  belongs_to :user
end
