ActiveAdmin.register Comment, :as => 'UserComments' do
  scope :all
  scope :checked
  scope :unchecked

  index  do
    column :id
    column :author
    column :comment
    column :checked do |comment|
      if comment.checked
        I18n.t(:checked)
      else
        I18n.t(:unchecked)
      end
    end
    column :created_at
    column :actions do |comment|
      link_to( I18n.t(:destroy ), admin_user_comment_path(comment), :method=> :delete) + ' ' + 
      unless comment.checked
        link_to( I18n.t(:checked), check_admin_user_comment_path(comment), :method => :put)
      end
    end
  end

   member_action :check, :method =>:put do
      commment = Comment.find(params[:id])
      commment.checked = true
      commment.save
      redirect_to :action => :index, :notice => 'Cheked!'
    end

end
