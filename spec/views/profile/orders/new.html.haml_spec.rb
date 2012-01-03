require 'spec_helper'

describe "profile_orders/new.html.haml" do
  before(:each) do
    assign(:order, stub_model(Profile::Order).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profile_orders_path, :method => "post" do
    end
  end
end
