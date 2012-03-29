# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "videos/new.html.haml" do
  before(:each) do
    assign(:video, stub_model(Video,
      :genre => "MyString",
      :producers => "MyString"
    ).as_new_record)
  end

  it "renders new video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => videos_path, :method => "post" do
      assert_select "input#video_genre", :name => "video[genre]"
      assert_select "input#video_producers", :name => "video[producers]"
    end
  end
end
