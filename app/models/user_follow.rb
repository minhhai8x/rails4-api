class UserFollow < ActiveRecord::Base
    belongs_to :user_id, class_name: 'User'
    belongs_to :friend_id, class_name: 'User'
end
