# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding data"

WebSetting.create({
	title: "www.ototown.com",
	description: "",
	keywords: "",
	header_tags: "",
	footer_tags: "",
	contact: "",
	email: "info@ototown.com"
	})

def load_rb(seed)
  require 'yaml'
  puts "#{Time.now} | Execute seed #{seed.inspect}"
  require "#{seed}"
  klass_name = ("seed_" + File.basename("#{seed}", '.rb').split('-').last).classify
  klass = klass_name.constantize
  klass.send(:seed)
end

Dir["#{Rails.root}/db/seeds/**/*.rb"].sort.each do |seed|
  load_rb(seed)
end

puts "Done!"