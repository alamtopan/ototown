module SeedContent
  def self.seed
    contents = [
      {
        title: 'Buy your new car on AutoDealer',
        content: 'Everything you need to build an amazing dealership website',
        category: 'Slider',
        pic: "#{Rails.root}/public/content/slide/slider1.jpg"
      },
      {
        title: 'NEW & 2nd HAND',
        content: 'More than 3500 vehicles in our offer',
        category: 'Slider',
        pic: "#{Rails.root}/public/content/slide/slider2.jpg"
      },
      {
        title: 'SUPER SPORTS',
        content: 'Only the finest breed of Supercars',
        category: 'Slider',
        pic: "#{Rails.root}/public/content/slide/slider3.jpg"
      },
      {
        title: 'QUALITY OF SERVICE',
        content: 'We guarantee BEST PRICES for second-hand cars',
        category: 'Slider',
        pic: "#{Rails.root}/public/content/slide/slider4.jpg"
      },
      {
        title: 'Find us here',
        content: "",
        category: 'Widget Find Us',
        pic: ''
      },
      {
        title: 'About Us',
        content: "",
        category: 'About Us',
        pic: ''
      },
      {
        title: 'Contact',
        content: "",
        category: 'About Us',
        pic: ''
      },
      {
        title: 'FAQ',
        content: "",
        category: 'About Us',
        pic: ''
      },
      {
        title: 'How do I add an offer?',
        content: "",
        category: 'Need Help',
        pic: ''
      },
      {
        title: 'How do I find a vehicle',
        content: "",
        category: 'Need Help',
        pic: ''
      },
      {
        title: 'Price list',
        content: "",
        category: 'Need Help',
        pic: ''
      }
    ]

    contents.each do |content_n|
      page_opts = {title: content_n[:title], category: content_n[:category]}
      page = PageContent.where(page_opts).first || PageContent.new(page_opts)
      page.content = File.open(content_n[:content]).read if content_n[:content].present? && File.exist?(content_n[:content])
      page.pic = File.new(content_n[:pic]) if content_n[:pic].present? && File.exist?(content_n[:pic])
      page.save
    end

  end
end
