require 'spec_helper'

describe "supports/edit.html.haml" do
  before(:each) do
    @support = assign(:support, stub_model(Support,
      :subject => "MyString",
      :email => "MyString",
      :message => "MyText"
    ))
  end

  it "renders the edit support form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => supports_path(@support), :method => "post" do
      assert_select "input#support_subject", :name => "support[subject]"
      assert_select "input#support_email", :name => "support[email]"
      assert_select "textarea#support_message", :name => "support[message]"
    end
  end
end
