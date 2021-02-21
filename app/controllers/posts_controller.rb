class PostsController < ApplicationController
  def index
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
  
  private
    def post_params
      params.require(:post).permit(:name, :image, :material, :cooking_time)
    end  
end
