class Setting < ActiveRecord::Base
 validates_uniqueness_of :name

  def self.preferences
    @setting = Setting.all
    set = {}
      @setting.each { |pref| set[pref.name.to_sym] = pref.value }
    return set
  end

  
  def self.preferences= (hash)
    @settings = Setting.where("name like '%'")

    hash.each do |key, value|
      setting = @settings.where(:name => key).first
      unless setting.nil?
      setting.value = value
      setting.save
      end
    end
  end
end
