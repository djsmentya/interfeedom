# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "comments/new.html.haml" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :user_id => 1,
      :audthor => "MyString",
      :content => "MyText",
      :commentable_id => 1,
      :commentable_type => "MyString"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_user_id", :name => "comment[user_id]"
      assert_select "input#comment_audthor", :name => "comment[audthor]"
      assert_select "textarea#comment_content", :name => "comment[content]"
      assert_select "input#comment_commentable_id", :name => "comment[commentable_id]"
      assert_select "input#comment_commentable_type", :name => "comment[commentable_type]"
    end
  end
end
