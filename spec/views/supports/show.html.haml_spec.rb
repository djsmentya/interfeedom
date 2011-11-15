require 'spec_helper'

describe "supports/show.html.haml" do
  before(:each) do
    @support = assign(:support, stub_model(Support,
      :subject => "Subject",
      :email => "Email",
      :message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
