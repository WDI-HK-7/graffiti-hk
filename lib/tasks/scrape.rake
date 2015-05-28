
require 'open-uri'

namespace :scrape do
  
  desc "Scraping graffiti-hk"
  task :graffiti_hk => :environment do
   # parse_all_grafs("bao")
    url = "http://globalstreetart.com/countries/HK"
    data = open(url)
    parsed_data = Nokogiri::HTML(data)
    artist_names = parsed_data.css("div > div > div > h3 > a")

    artist_names.each do |n| #n represents every single element of the array of HTML elements
      puts n.text.inspect
      parse_all_grafs(n.text.gsub(/\n/,''))
    end
  end  
end

def parse_all_grafs(artist_name)
  
  url = "http://globalstreetart.com/" + artist_name

  data = open(url)
  parsed_data = Nokogiri::HTML(data)
  graf_pics = parsed_data.css(".media.image")

  graf_pics.each do |n|
    background_url = n['style'].gsub('background-image: ', '').gsub('url(', '').gsub(')', '')

    image = open(background_url)

    Post.create(:picture => image)

    puts background_url
  end

end

namespace :scrape do

  desc "scraping more graffities"
  task :graffities => :environment do 

    url = "http://hkstreetart.com/"
    data = open(url)
    parsed_data = Nokogiri::HTML(data)
    graf_img = parsed_data.css("div > div > div > a > img")

    graf_img.each do |n|
      pics = n.xpath('//div/a/@href')
      image = open(pics)

      Post.create(:picture => image)

      puts pics 
    end
  end 
end


