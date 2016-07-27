class User < ActiveRecord::Base
  has_secure_password
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'

  validates :name, presence: true
  validates :email, uniqueness: true
end
