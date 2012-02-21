namespace :ifree do
  desc "Erase and fill database"
  task :parse_films => :environment do
    require 'open-uri'
    require 'nokogiri'
    pagination = 0
    @video = Product.new
    @content = {}
    @user = User.find_by_email('djsmentya@gmail.com')
    for i in [1..9]

      fil = open('http://afisha-if.com/filmu/dramu?start=' + pagination.to_s)
        doc = Nokogiri::HTML(fil)  
        doc.css('br').each {|nd| nd.remove}
        puts 'page downloaded ...'
        doc.search('.news_item_c').each do |news|
          puts 'img downloading...'
          img = open('http://afisha-if.com' + news.search('img').first['src'].gsub(/\s/,'%20'))
          puts img
          unless img.nil?
            @video.image = img
            title = news.search('.contentpagetitle').first.content

            @video.name_ua = title[0..title.index('/')-1]
            @video.name_en =  title[(title.index('/')+1)..title.length].sub /\s\(\d\d\d\d\) дивитись онлайн/, ''


            news.search('strong').each do |el|
              @content[el.content] = el.next.content
            end
            @video.description = @content['Опис:']
            @video.producer = @content['Режисер:']
            @video.genre_id = 1
            @video.product_type = 'Video'
            @video.available_on = Time.now
            @video.count_on_hand = 50
            @video.price = rand(50)
            @video.user = @user
            puts 'saving video'
            puts @video.inspect  
            puts @video.save.inspect
          end
          @video = Product.new
          @content = {}
          pagination += 10
        end
      end
    
  end
end

