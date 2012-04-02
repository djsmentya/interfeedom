require 'spec_helper'

describe "withdraws/edit" do
  before(:each) do
    @withdraw = assign(:withdraw, stub_model(Withdraw,
      :amount => 1.5,
      :payment_type => "MyString"
    ))
  end

  it "renders the edit withdraw form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => withdraws_path(@withdraw), :method => "post" do
      assert_select "input#withdraw_amount", :name => "withdraw[amount]"
      assert_select "input#withdraw_payment_type", :name => "withdraw[payment_type]"
    end
  end
end
