class CommentsController < ApplicationController

  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /posts/1/comments
  def index
    @comments = @post.comments
    @comment = Comment.new(name: '', body: '')
    render layout: false
  end

  # POST /posts/1/comments
  def create
    @comment = Comment.new(comment_params. merge({post_id: @post.id}))

    respond_to do |format|
      if @comment.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace(:new_comment, @comment) }
      else
        format.html { render partial: "new" }
      end
    end
  end

private
    
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params[:comment].permit(:name, :body)
  end

end
