module SeedNews
  def self.seed
  	title_list = ["Nissan GT-R Hybrid Dengan Tenaga Lebih Besar","Nissan GT-R Hybrid Dengan Tenaga Lebih Besar","Nissan GT-R Hybrid Dengan Tenaga Lebih Besar","Nissan GT-R Hybrid Dengan Tenaga Lebih Besar","Nissan GT-R Hybrid Dengan Tenaga Lebih Besar"]

  	title_list.each_with_index do |title,index|
	  	News.create( 
	  		:title => title, 
	  		:content => File.open("#{Rails.root}/db/fixtures/contents/content.txt").read,
	  		:category_id => 1, 
	  		pic: File.new("#{Rails.root}/public/content/news.jpg") )
		end
  end
end
