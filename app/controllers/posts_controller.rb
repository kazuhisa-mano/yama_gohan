class PostsController < ApplicationController
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
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end  

  private
    def post_params
      params.require(:post).permit(:name, :image, :material, :recipe, :cooking_time)
    end
end
