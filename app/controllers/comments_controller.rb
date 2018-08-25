class CommentsController < ApplicationController
  def create
   @product = Product.find(params[:id])
   @user = current_user.id
   @comment = @product.comments.new(comment_params)
   @comment.user_id=@user
   @comment.save
 end
 def new

   @comment = Comment.new
 end
 def edit
   @comment = Comment.find_by_id(params[:id])
 end
 def destroy
   @comment = Comment.find_by_id(params[:id])
   @comment.destroy

 end

 private
   def comment_params
     params.require(:comment).permit(:content)
   end

end
