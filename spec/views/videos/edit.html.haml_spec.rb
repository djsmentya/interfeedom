require 'spec_helper'

describe "videos/edit.html.haml" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :genre => "MyString",
      :producers => "MyString"
    ))
  end

  it "renders the edit video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => videos_path(@video), :method => "post" do
      assert_select "input#video_genre", :name => "video[genre]"
      assert_select "input#video_producers", :name => "video[producers]"
    end
  end
end
