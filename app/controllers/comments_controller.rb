class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @user = current_user

    respond_to do |format|
      if @comment.save
      #  ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
        format.html { redirect_to @product, notice: 'Thanks for your Review!' }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { redirect_to @product, alert: 'You need to add both Star-Rating and a Comment to create a Review!' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to product, alert: 'Your Review was deleted!'}
      format.json { head :no_content }
    end
  end

  private
  # Using a private method to encapsulate the permissible parameters is
  # a good pattern since you'll be able to reuse the same permit
  # list between create and update. Also, you can specialize this method
  # with per-user checking of permissible attributes.
    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end
end
