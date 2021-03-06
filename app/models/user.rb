# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  name                   :string(255)     default(""), not null
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  password_salt          :string(255)
#  up_votes               :integer         default(0), not null
#  down_votes             :integer         default(0), not null
#  created_at             :datetime
#  updated_at             :datetime
#  authentication_token   :string(255)
#  banned                 :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :token_authenticatable, :omniauthable, :authentication_keys => [:name]
  
  cattr_accessor :current_user
  # attr_accessor :name
  # attr_accessible :name
  
  # Setup accessible (or protected) attributes for your model
  USER_ACCESSIBLE_ATTRS = [:email, :password, :password_confirmation, :remember_me, :name, :data_set_attributes]
  ADMIN_ACCESSIBLE_ATTRS = USER_ACCESSIBLE_ATTRS + [:banned]
  attr_accessible *USER_ACCESSIBLE_ATTRS
  attr_accessible *ADMIN_ACCESSIBLE_ATTRS, as: :admin
  
  has_many :votes, :as => :voteable
  has_many :comments
  has_many :posts
  has_many :notifications, :order => 'created_at DESC'
  has_many :admin_auths
  has_many :services, :dependent => :destroy
  
  has_one :data_set
  accepts_nested_attributes_for :data_set
  
  validates_uniqueness_of :name
  # validates_format_of :name, with: /\A[a-zA-Z0-9]+\z/i, message: 'can only contain letters and numbers.'
  
  make_voter
  
  def all_notifications
    {
      new_notifications: self.notifications.where(unread: true),
      old_notifications: self.notifications.find(:all, conditions: {unread: false}, limit: 20)
    }
  end
end
