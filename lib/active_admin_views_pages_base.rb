# -*- encoding : utf-8 -*-
class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document

  private

  # Renders the content for the footer
  def build_footer
    div :id => "footer" do
      raw "Copyright &copy; #{Date.today.year.to_s} #{link_to('Eugene Smentina', 'http://example.com')} "
      end
  end

end
