# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def create
    commentable = Product.find(params[:pr_id])
   if commentable.comments.create(params[:comment])     
      flash[:notice] = "Successfully created comment."
      redirect_to :back
    else
      render :action => 'new'
    end
  end
  
  def destroy 
   comment =  Comment.find params[:id]
   comment.destroy
   redirect_to :back, :notice => 'Comment deleted'
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id|id/
        return  Product.find(value)
      end
    end
  end
end
