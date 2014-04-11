class Operator < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :profile_attributes, :role_id
  # Include default devise modules. Others available are:
  # :confirmable, and 
  devise :database_authenticatable, :lockable, :timeoutable, 
         :recoverable, :rememberable, :trackable, :validatable
end
