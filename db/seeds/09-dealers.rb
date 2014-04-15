module SeedDealer
  def self.seed
    10.times do |i|
      dealer = Dealer.find_or_initialize_by_email("dealer-#{i}@ototown.com")
      dealer.username = "dealer-#{i}"
      dealer.password = "12345678"
      dealer.password_confirmation = "12345678"
      dealer.profile.full_name = "Dealer-#{i} Ototown"
      dealer.profile.birthday = "1990-08-08"
      dealer.profile.address = "Jalan Kebayoran Lama No #{i+1}"
      dealer.profile.city = "Jakarta"
      dealer.profile.gender = "Laki-laki"
      dealer.dealer_info.address = "Jalan Kebayoran NO #{i+1} "
      dealer.dealer_info.active = true
      dealer.dealer_info.category_type = ['Dealer', 'Workshop'].shuffle.first
      dealer.dealer_info.title = "Title Dealer -#{i}"
      dealer.dealer_info.description = "Description Dealer -#{i}"
      dealer.dealer_info.phone = "38490238904#{i}"
      dealer.dealer_info.email = "dealer-#{i}@dealerototown.com"
      dealer.dealer_info.latitude = "92#{i}".to_i
      dealer.dealer_info.longitude = "82#{i}".to_i
      if dealer.save
        puts "dealer-#{i}@ototown.com -> saved"
      else
        puts dealer.error.full_messages
      end
    end
  end
end