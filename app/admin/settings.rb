ActiveAdmin.register_page 'settings' do
  menu :label => "Налаштування", :parent => 'Адміністрування'

  action_item do
      link_to "View Site", "/"
  end

  content do
    pref = Setting.preferences
    semantic_form_for Setting.new do |p|
      p.inputs 'set' do
        page = p.input(:value,
                       :label => "price_ratio",
                       :input_html => {:value => pref[:price_ratio], :name => 'setting[price_ratio]'})
        page << p.buttons
        page
      end
    end
  end

end


