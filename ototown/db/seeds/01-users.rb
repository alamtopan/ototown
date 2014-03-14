module SeedUser
  def self.seed
    user = Admin.find_or_initialize_by_email("admin_master@ototown.com")
    user.username = "admin"
    user.password = "12345678"
    user.password_confirmation = "12345678"
    user.save!
  end
end