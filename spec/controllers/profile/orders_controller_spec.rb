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

describe Profile::OrdersController do

  # This should return the minimal set of attributes required to create a valid
  # Profile::Order. As you add validations to Profile::Order, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all profile_orders as @profile_orders" do
      order = Profile::Order.create! valid_attributes
      get :index
      assigns(:profile_orders).should eq([order])
    end
  end

  describe "GET show" do
    it "assigns the requested order as @order" do
      order = Profile::Order.create! valid_attributes
      get :show, :id => order.id
      assigns(:order).should eq(order)
    end
  end

  describe "GET new" do
    it "assigns a new order as @order" do
      get :new
      assigns(:order).should be_a_new(Profile::Order)
    end
  end

  describe "GET edit" do
    it "assigns the requested order as @order" do
      order = Profile::Order.create! valid_attributes
      get :edit, :id => order.id
      assigns(:order).should eq(order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Profile::Order" do
        expect {
          post :create, :order => valid_attributes
        }.to change(Profile::Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, :order => valid_attributes
        assigns(:order).should be_a(Profile::Order)
        assigns(:order).should be_persisted
      end

      it "redirects to the created order" do
        post :create, :order => valid_attributes
        response.should redirect_to(Profile::Order.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        # Trigger the behavior that occurs when invalid params are submitted
        Profile::Order.any_instance.stub(:save).and_return(false)
        post :create, :order => {}
        assigns(:order).should be_a_new(Profile::Order)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Profile::Order.any_instance.stub(:save).and_return(false)
        post :create, :order => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested order" do
        order = Profile::Order.create! valid_attributes
        # Assuming there are no other profile_orders in the database, this
        # specifies that the Profile::Order created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Profile::Order.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => order.id, :order => {'these' => 'params'}
      end

      it "assigns the requested order as @order" do
        order = Profile::Order.create! valid_attributes
        put :update, :id => order.id, :order => valid_attributes
        assigns(:order).should eq(order)
      end

      it "redirects to the order" do
        order = Profile::Order.create! valid_attributes
        put :update, :id => order.id, :order => valid_attributes
        response.should redirect_to(order)
      end
    end

    describe "with invalid params" do
      it "assigns the order as @order" do
        order = Profile::Order.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Profile::Order.any_instance.stub(:save).and_return(false)
        put :update, :id => order.id, :order => {}
        assigns(:order).should eq(order)
      end

      it "re-renders the 'edit' template" do
        order = Profile::Order.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Profile::Order.any_instance.stub(:save).and_return(false)
        put :update, :id => order.id, :order => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested order" do
      order = Profile::Order.create! valid_attributes
      expect {
        delete :destroy, :id => order.id
      }.to change(Profile::Order, :count).by(-1)
    end

    it "redirects to the profile_orders list" do
      order = Profile::Order.create! valid_attributes
      delete :destroy, :id => order.id
      response.should redirect_to(profile_orders_url)
    end
  end

end
