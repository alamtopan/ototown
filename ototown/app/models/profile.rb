class Profile < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :dealer, foreign_key: 'user_id'
  has_attached_file :avatar, :styles => { 
                                          :medium => "300x300>", 
                                          :thumb => "100x100>" 
                                        }

end