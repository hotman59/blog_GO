class LikesController < ApplicationController
  before_action :set_like, only: [:edit, :update, :destroy]

  # GET /likes
  # GET /likes.json


  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new
    @like.user_id = current_user.id
    @like.comment_id = params[:comment_id]
    @like.post_id = params[:post_id]
    @post=Post.find(params[:post_id])
    @comment=Comment.find(params[:comment_id])

    respond_to do |format|
      if @like.save
        format.html { redirect_to @post, notice: 'Like was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @post=Post.find(params[:post_id])
    if params[comment_id] != nil
    @like=Like.where(user_id:params[:user_id]).where(comment_id:params[:comment_id]).first
    else
    @like=Like.where(user_id:params[:user_id]).where(post_id:params[:post_id]).first
    end
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:user_id, :post_id, :comment_id)
    end
end
