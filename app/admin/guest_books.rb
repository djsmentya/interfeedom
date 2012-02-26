ActiveAdmin.register GuestBook do

  actions :index, :show, :destroy
  
  index do
    column :id
    column :name
    column :email
    column :text
    column :created_at
    column  ''  do |resource|
      links = link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      
      links
    end

  end

  show do
    attributes_table do
      row :name
      row :email
      row :text
    end
    div do
      render  :partial => 'reply'
    end
  end

  sidebar I18n.t('active_admin.order.sidebar.gueset_book_messages'), :only => :show do
    table_for(guest_book.comments) do |t|
      t.column :comment , :label => Comment.human_attribute_name('comment')  
      t.column '' do |comm|
        unless comm.id.nil?
          link_to image_tag('site/webicons/x-red.gif'), comment_path(comm.id), :method => :delete
        end
      end
    end
  end

  member_action :reply, :method => :post  do
    @commentable = GuestBook.find(params[:id])

    @commentable.comments.create(params[:comment])
    redirect_to :back, :notice => 'Comment created' 
  end
end
