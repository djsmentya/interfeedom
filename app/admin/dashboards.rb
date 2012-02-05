ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  section I18n.t('active_admin.section.recent_users'), :priority => 2 do
    table_for User.all(:order => 'id DESC', :limit => 10) do
      column(User.model_name.human) {|user| link_to(user.email, admin_user_path(user)) }
      column(User.human_attribute_name :created_at) {|user| content_tag(:div, I18n.l(user.created_at, :format => :short)) }
    end
  end
  
  section I18n.t('active_admin.section.recent_orders'), :priority => 1 do
    table_for Order.all(:limit => 10) do
      column(Order.human_attribute_name :state) {|order| status_tag(order.state) }
      column(User.model_name.human) {|order| link_to(order.user.email, admin_user_path(order.user)) }
      #column("Total") {|order| number_to_currency order.total_price }
    end
  end
end
