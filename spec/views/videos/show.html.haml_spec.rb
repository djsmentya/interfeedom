require 'spec_helper'

describe "videos/show.html.haml" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :genre => "Genre",
      :producers => "Producers"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Genre/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Producers/)
  end
end
