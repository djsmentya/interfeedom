class MessagesController < InheritedResources::Base
  layout 'profile'

  def index
    if params[:place].eql?('outbox')
      @messages = current_user.messages
    else
      @messages = Message.where(:to_user_id => current_user.id)
    end
  end
end
