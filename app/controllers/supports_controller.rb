class SupportsController < ActionController::Base
 def index
 end
 
 def new
  @suppurt = Sepport.new
 end

 def create
  support = Support.new(params[:support])
  if support.save
    redirect_to root_path, :notice =>'Your message will be read' :locales => :locale => params[:locale]
  end
 end

end
