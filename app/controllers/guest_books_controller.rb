# -*- encoding : utf-8 -*-
class GuestBooksController < ApplicationController
  before_filter :list_guest_books
  def index
    @guest_books
    @guest_book ||= GuestBook.new
  end

  def create
    @guest_book = GuestBook.new(params[:guest_book])
    respond_to do |format|
      if @guest_book.save
        format.html { redirect_to guest_books_path, :notice => 'Product was successfully created.' }
      else
        format.html { render :action => "index", :locals => {:guest_books => @guest_books, :guest_book => @guest_book} }
      end
    end
  end

  private
    def list_guest_books
      @guest_books ||= GuestBook.order('created_at DESC').page(params[:page])
    end
end
