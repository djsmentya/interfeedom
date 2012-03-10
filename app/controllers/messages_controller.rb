class MessagesController < InheritedResources::Base
  layout 'profile'

  def index
    @messages = Message.where(:to_user_id => current_user.id)
  end
end
