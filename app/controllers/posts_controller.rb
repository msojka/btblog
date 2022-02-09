class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :comments]

  # GET /posts
  def index
    @posts = Post.all
  end
    
  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new title: '', body: ''
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    authorize!(@post)
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully removed.'
  end

private
    
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params[:post].permit(:title, :body)
  end

end
