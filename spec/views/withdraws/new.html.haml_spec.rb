require 'spec_helper'

describe "withdraws/new" do
  before(:each) do
    assign(:withdraw, stub_model(Withdraw,
      :amount => 1.5,
      :payment_type => "MyString"
    ).as_new_record)
  end

  it "renders new withdraw form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => withdraws_path, :method => "post" do
      assert_select "input#withdraw_amount", :name => "withdraw[amount]"
      assert_select "input#withdraw_payment_type", :name => "withdraw[payment_type]"
    end
  end
end
