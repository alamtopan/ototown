class Message < ActiveRecord::Base
  belongs_to :user_id, foreign_key: 'recipient_id'
end
