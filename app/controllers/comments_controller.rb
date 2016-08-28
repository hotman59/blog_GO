class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_post, only: [:create, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Commentaire ajouté.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render @post, alerte:"impossible de créer le Commentaire" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

def destroy(post_params)
  @comment = Comment.find(params[:id])
  @comment.destroy

  redirect_to post_path(@post)
end

private
def set_post
@post = Post.find(params[:post_id])
end

def comment_params
  params.require(:comment).permit(:user_id, :body, :post_id)
end
end
