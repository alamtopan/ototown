module SeedCar
  
  def self.seed
    url = 'http://ototown.com/used-car/bmw-325i-10'
    resp = RestClient.get URI.escape(url)
    @doc  = Nokogiri::HTML(resp.body)
    (1..30).to_a.each do |i|
      puts "Data -#{i}"
      content = @doc.css('.detail-car-up')  
      params  = {
                  name: @doc.css('.top-title').text.strip.gsub(/\t/, '')+"-#{i}",
                  type_product: content.css('.detail-content').children[0].text.strip,
                  condition: @doc.css('.detail-car-middle .car-detail-condition').css('font').text,
                  brand: content.css('.detail-content').children[1].text.strip,
                  model: content.css('.detail-content').children[2].text.strip, 
                  color: content.css('.detail-content').children[4].text.strip,
                  year:  content.css('.detail-content').children[3].text.strip,
                  plate_number: content.css('.detail-content').children[5].text.strip,
                  exp_date:  content.css('.detail-content').children[6].text.strip,
                  kilometer: content.css('.detail-content').children[7].text.strip.to_i,
                  door: content.css('.detail-content').children[8].text.strip.to_i,
                  seat: content.css('.detail-content').children[9].text.strip.to_i,
                  transmission: content.css('.detail-content').children[10].text.strip,
                  engine: content.css('.detail-content').children[11].text.strip,
                  cylinders: content.css('.detail-content').children[12].text.strip,
                  fuel: content.css('.detail-content').children[13].text.strip,
                  location: content.css('.detail-content').children[14].text.strip
                }  
      car = Car.where(name: params[:name]).first
      if car.present?
        car.update_attributes(params)
        puts 'success updated'
      else
        car = Car.new(params)
        if car.save
          puts 'success saved' 
        else
          puts 'failed save'
        end
      end
      car = Car.where(name: params[:name]).first
      items = @doc.css('#slider .field-item')
      items.each do |item|
        images = {
          image: URI.parse(item.css('img').attribute('src').value),
          product_id: car.id
        }
        image_product = ImageProduct.new(images)
        if image_product.save
          puts "\timage saved"
        else
          puts "\timage fail to save"
        end
      end
    end
  end

end