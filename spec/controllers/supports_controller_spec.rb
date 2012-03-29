# -*- encoding : utf-8 -*-
require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SupportsController do

  # This should return the minimal set of attributes required to create a valid
  # Support. As you add validations to Support, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all supports as @supports" do
      support = Support.create! valid_attributes
      get :index
      assigns(:supports).should eq([support])
    end
  end

  describe "GET show" do
    it "assigns the requested support as @support" do
      support = Support.create! valid_attributes
      get :show, :id => support.id
      assigns(:support).should eq(support)
    end
  end

  describe "GET new" do
    it "assigns a new support as @support" do
      get :new
      assigns(:support).should be_a_new(Support)
    end
  end

  describe "GET edit" do
    it "assigns the requested support as @support" do
      support = Support.create! valid_attributes
      get :edit, :id => support.id
      assigns(:support).should eq(support)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Support" do
        expect {
          post :create, :support => valid_attributes
        }.to change(Support, :count).by(1)
      end

      it "assigns a newly created support as @support" do
        post :create, :support => valid_attributes
        assigns(:support).should be_a(Support)
        assigns(:support).should be_persisted
      end

      it "redirects to the created support" do
        post :create, :support => valid_attributes
        response.should redirect_to(Support.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved support as @support" do
        # Trigger the behavior that occurs when invalid params are submitted
        Support.any_instance.stub(:save).and_return(false)
        post :create, :support => {}
        assigns(:support).should be_a_new(Support)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Support.any_instance.stub(:save).and_return(false)
        post :create, :support => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested support" do
        support = Support.create! valid_attributes
        # Assuming there are no other supports in the database, this
        # specifies that the Support created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Support.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => support.id, :support => {'these' => 'params'}
      end

      it "assigns the requested support as @support" do
        support = Support.create! valid_attributes
        put :update, :id => support.id, :support => valid_attributes
        assigns(:support).should eq(support)
      end

      it "redirects to the support" do
        support = Support.create! valid_attributes
        put :update, :id => support.id, :support => valid_attributes
        response.should redirect_to(support)
      end
    end

    describe "with invalid params" do
      it "assigns the support as @support" do
        support = Support.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Support.any_instance.stub(:save).and_return(false)
        put :update, :id => support.id, :support => {}
        assigns(:support).should eq(support)
      end

      it "re-renders the 'edit' template" do
        support = Support.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Support.any_instance.stub(:save).and_return(false)
        put :update, :id => support.id, :support => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested support" do
      support = Support.create! valid_attributes
      expect {
        delete :destroy, :id => support.id
      }.to change(Support, :count).by(-1)
    end

    it "redirects to the supports list" do
      support = Support.create! valid_attributes
      delete :destroy, :id => support.id
      response.should redirect_to(supports_url)
    end
  end

end
