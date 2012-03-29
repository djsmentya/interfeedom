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

describe VideosController do

  # This should return the minimal set of attributes required to create a valid
  # Video. As you add validations to Video, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all videos as @videos" do
      video = Video.create! valid_attributes
      get :index
      assigns(:videos).should eq([video])
    end
  end

  describe "GET show" do
    it "assigns the requested video as @video" do
      video = Video.create! valid_attributes
      get :show, :id => video.id.to_s
      assigns(:video).should eq(video)
    end
  end

  describe "GET new" do
    it "assigns a new video as @video" do
      get :new
      assigns(:video).should be_a_new(Video)
    end
  end

  describe "GET edit" do
    it "assigns the requested video as @video" do
      video = Video.create! valid_attributes
      get :edit, :id => video.id.to_s
      assigns(:video).should eq(video)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Video" do
        expect {
          post :create, :video => valid_attributes
        }.to change(Video, :count).by(1)
      end

      it "assigns a newly created video as @video" do
        post :create, :video => valid_attributes
        assigns(:video).should be_a(Video)
        assigns(:video).should be_persisted
      end

      it "redirects to the created video" do
        post :create, :video => valid_attributes
        response.should redirect_to(Video.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved video as @video" do
        # Trigger the behavior that occurs when invalid params are submitted
        Video.any_instance.stub(:save).and_return(false)
        post :create, :video => {}
        assigns(:video).should be_a_new(Video)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Video.any_instance.stub(:save).and_return(false)
        post :create, :video => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested video" do
        video = Video.create! valid_attributes
        # Assuming there are no other videos in the database, this
        # specifies that the Video created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Video.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => video.id, :video => {'these' => 'params'}
      end

      it "assigns the requested video as @video" do
        video = Video.create! valid_attributes
        put :update, :id => video.id, :video => valid_attributes
        assigns(:video).should eq(video)
      end

      it "redirects to the video" do
        video = Video.create! valid_attributes
        put :update, :id => video.id, :video => valid_attributes
        response.should redirect_to(video)
      end
    end

    describe "with invalid params" do
      it "assigns the video as @video" do
        video = Video.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Video.any_instance.stub(:save).and_return(false)
        put :update, :id => video.id.to_s, :video => {}
        assigns(:video).should eq(video)
      end

      it "re-renders the 'edit' template" do
        video = Video.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Video.any_instance.stub(:save).and_return(false)
        put :update, :id => video.id.to_s, :video => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested video" do
      video = Video.create! valid_attributes
      expect {
        delete :destroy, :id => video.id.to_s
      }.to change(Video, :count).by(-1)
    end

    it "redirects to the videos list" do
      video = Video.create! valid_attributes
      delete :destroy, :id => video.id.to_s
      response.should redirect_to(videos_url)
    end
  end

end
