class ActiveAdmin::Views::HeaderRenderer < ::ActiveAdmin::Renderer
  protected

        def utility_navigation
        content_tag 'p', :id => "utility_nav" do
          if current_active_admin_user?
            html = content_tag(:span, display_name(current_active_admin_user), :class => "current_user")

             [:en,:ua].each do |locale|
              html << link_to( image_tag("flags/#{locale}.png"), locales_change_locale_path(:locale => locale), { :class => :active, :title => I18n.t(locale)})
             end

            if active_admin_application.logout_link_path
              html << link_to(I18n.t('active_admin.logout'), logout_path, :method => logout_method)
            end
          end
        end
      end

end
