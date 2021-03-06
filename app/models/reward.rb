class Reward < ActiveRecord::Base
  belongs_to :quest
  has_many :user_rewards
  has_many :users, through: :user_rewards
  validates_presence_of :description
end
