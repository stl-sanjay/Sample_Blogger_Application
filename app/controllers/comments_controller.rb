class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to @blog }
      format.js
    end
  end

 def destroy
    #@blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
        format.html { redirect_to @blog }
        format.js   { render :layout => false }
    end
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
