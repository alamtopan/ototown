module SeedUser
  def self.seed
  	# admin
    admin = Admin.find_or_initialize_by_email("admin_master@ototown.com")
    admin.username = "admin"
    admin.password = "12345678"
    admin.password_confirmation = "12345678"
    admin.save!
    # user
    user = User.find_or_initialize_by_email("user@ototown.com")
    user.username = "user"
    user.password = "12345678"
    user.password_confirmation = "12345678"
    user.profile.full_name = "User Ototown"
    user.profile.birthday = "1990-08-08"
    user.profile.address = "Jalan Kebayoran Lama No 60"
    user.profile.city = "Jakarta"
    user.profile.gender = "Laki-laki"
    user.save
  end
end