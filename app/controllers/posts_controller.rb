class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def checked
    post = Post.find(params[:id])
    #checkedカラムはboolean型なので「post.checked」でtrue/falseが返却される
    if post.checked
      #「post.checked」がtrue、つまり既読している
      post.update(checked: false)
    else
      #「post.checked」がfalse、つまり既読していない  
      post.update(checked: true)
    end
    #itemにupdateしたレコードを格納する
    item = Post.find(params[:id])
    #jsonのデータ形式（ハッシュ）でchecked.jsに返却する
    render json: { post: item }
  end
end
