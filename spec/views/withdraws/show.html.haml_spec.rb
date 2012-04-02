require 'spec_helper'

describe "withdraws/show" do
  before(:each) do
    @withdraw = assign(:withdraw, stub_model(Withdraw,
      :amount => 1.5,
      :payment_type => "Payment Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Payment Type/)
  end
end
