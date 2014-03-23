module SeedNews
  def self.seed
  	title_list = ["PELUNCURAN SATELIT","APLIKASI SEPAKBOLA","BPL"]
  	desc_list = [
  		"Dengan total investasi lebih dari 300 juta dolar AS, BiGTV menawarkan kebebasan dalam mengakses program-program televisi yang terbaik bagi masyarakat di tanah air. Salah satu bentuk investasi tersebut adalah satelit Lippo Star 1 (KU Band MPEG4) yang diluncurkan tahun lalu di French Guiana. Dilengkapi 12 KU Band transponder, yang keseluruhannya mencakup ke Indonesia, Lippo Star 1 saat ini memiliki jumlah transponder terbanyak di Indonesia. Hal ini memungkinkan BiGTV untuk menyiarkan lebih banyak saluran televisi, baik dalam SD maupun HD, sekaligus menjadikannya TV satelit berbayar pertama yang menyajikan saluran HD lebih banyak bagi para konsumennya.",
  		"Ingin tahu jadwal pertandingan, atau hasil pertandingan? Mudah, tekan tombol merah di remote control Dekoder LG Anda di saat Anda menonton channel beIN SPORT 1 atau beIN SPORT 2. Aplikasi sepakbola akan membantu Anda dengan data-data sepakbola terkini untuk melengkapi pengalaman menonton Anda.",
  		"BIGTV membeli hak siar dari MP & Silva untuk menayangkan beIN 1 dan beIN 2 dalam qualitas High Definition. Untuk itu para pelanggan BIGTV dapat menikmati pertandingan Liga Inggris, Liga Itali dan Liga Prancis."
  		]
  	author_list = ["Admin"]

  	title_list.each_with_index do |title,index|
	  	Blog.create( :title => title, :description => desc_list[index], :author => author_list.first, picture: File.new("#{Rails.root}/public/blog_picture/#{title}.png") )
		end
  end
end
