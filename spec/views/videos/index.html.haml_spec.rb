require 'spec_helper'

describe "videos/index.html.haml" do
  before(:each) do
    assign(:videos, [
      stub_model(Video,
        :genre => "Genre",
        :producers => "Producers"
      ),
      stub_model(Video,
        :genre => "Genre",
        :producers => "Producers"
      )
    ])
  end

  it "renders a list of videos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Producers".to_s, :count => 2
  end
end
