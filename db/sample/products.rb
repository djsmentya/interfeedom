# -*- encoding : utf-8 -*-
Product.seed do |s|
  s.id = 1
  s.name_ua = "В пошуках Немо"
  s.name_en = "Finding Nemo"
  s.description_ua = "Після нападу хижої риби, Марлін втратив дружину і безліч ікринок, із яких згодом повинні були вирости його діти. У нього залишився лише один синочок - і сьогодні, через багато років, Немо вперше йде до школи. Але будучи вельми неслухняною дитиною, він запливає занадто далеко, в заборонену для маленьких риб територію, і там його ловить водолаз. Тепер подальша доля Немо залежить від його друзів по нещастю - таких же бранців акваріума в кабінеті дантиста, які готують втечу. А в цей час Марлін і його нова знайома, забудькувата рибка Дорі, відправляються на пошуки Немо." 
  s.description_en = "After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home. "
  s.available_on = Time.now
  s.count_on_hand = 50
  s.image = File.new(File.join(Rails.root, "db/sample/images", "nemo.jpg"))
  s.product_type = "Video"
  s.genre_id  = Genre.find_or_create_by_name('Cartoon')
  s.producer  = "Andrew Stanton"
end
