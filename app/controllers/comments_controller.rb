class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Commentaire ajouté.' }
        format.js {}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render @post, alerte:"impossible de créer le Commentaire" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

def destroy
  @post=Post.find(params[:post_id])
  @comment=Comment.find(params[:id])
  respond_to do |format|
    if @comment.destroy
      format.html { redirect_to @post, notice: 'Commentaire supprimé.' }
      format.js
      format.json { render :show, status: :delete, location: @post }
    else
      format.html { render @post, alerte:"impossible de créer le Commentaire" }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end

private

def comment_params
  params.require(:comment).permit(:user_id, :body, :post_id)
end
end
