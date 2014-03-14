class UsersController < ApplicationController
	def user_home
		render layout: 'application_user'
	end
	def user_profile
		render layout: 'application_user'
	end
end