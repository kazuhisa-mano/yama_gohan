class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :show]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(nil) #viewからタグの名前を一緒に受け取る
    if @post.save
      @post.save_tag(tag_list) #save_tagはapp/models/post.rbに定義
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def search
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
    @post_tags = @post.tags
  end

  def edit
    @post = Post.find(params[:id])
    # @tag_list = @post.tags.pluck(:tag_name)
    @tags = Tag.all
    if @post.user == current_user
      render "edit"
    else
      redirect_to posts_path
    end  
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      redirect_to posts_path
    else
      redirect_to post_path(@post.id)
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :image, :material, :recipe, :cooking_time)
    end
end