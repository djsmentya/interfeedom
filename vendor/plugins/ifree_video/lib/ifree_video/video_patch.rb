# -*- encoding : utf-8 -*-
module VideoPatch
  def self.included(klass)
    klass.extend ClassMethods
    $extension_list << 'acts_as_ifree_video'
  end

  module ClassMethods
    def acts_as_ifree_video
      belongs_to :genre
    end
  end
end
::ActiveRecord::Base.send(:include, VideoPatch)
