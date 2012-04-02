require 'spec_helper'

describe "withdraws/index" do
  before(:each) do
    assign(:withdraws, [
      stub_model(Withdraw,
        :amount => 1.5,
        :payment_type => "Payment Type"
      ),
      stub_model(Withdraw,
        :amount => 1.5,
        :payment_type => "Payment Type"
      )
    ])
  end

  it "renders a list of withdraws" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Type".to_s, :count => 2
  end
end
