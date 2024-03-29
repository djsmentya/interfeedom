# -*- encoding : utf-8 -*-
class VideosController < ApplicationController
  # GET /videos
  # GET /videos.json
  def index
    #scope_keys = []
    #scope_values = []
      #params.each do |key, value|
        #if  key =~ /video_*/ and !value.blank?
         #field =  key.sub /video_/, ''
          #scope_keys << (field + ' = ?')
          #scope_values <<(value)
        #end
      #end
      #scope_keys << 'product_type = ?'
      #scope_values << 'Video'
    #@videos = Product.try(:where, scope_keys + scope_values).try(:order, 'created_at DESC').try(:page, params[:page])
  @videos = Product.video.order('created_at DESC').page(params[:page])
  unless params[:video_genre_id].blank?
    @videos = @videos.where( :genre_id => params[:video_genre_id])
  end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @video }
    end
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Product.find(params[:id])
    @property = Property.new
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(params[:video])


    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, :notice => 'Video was successfully created.' }
        format.json { render :json => @video, :status => :created, :location => @video }
      else
        format.html { render :action => "new" }
        format.json { render :json => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.new(params[:video])
    #@video.property.update_attribute :value, {:genre => params[:genre]}
    redirect_to :back, :notice => params.inspect
    #@video = Video.find(params[:id])
    #
    #respond_to do |format|
    #  if @video.update_attributes(params[:video])
    #    format.html { redirect_to @video, :notice => 'Video was successfully updated.' }
    #    format.json { head :ok }
    #  else
    #    format.html { render :action => "edit" }
    #    format.json { render :json => @video.errors, :status => :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :ok }
    end
  end
end
