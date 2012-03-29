# -*- encoding : utf-8 -*-
module ExtensionInitializer

  def self.included(klass)
    $extension_list.each do |extention|
      klass.send extention.to_s
    end
  end

end
