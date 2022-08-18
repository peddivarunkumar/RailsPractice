class ArticlesController < ApplicationController
  before_action :authenticate_user
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
   
    @article = Article.find(params[:id])
    isCurrentUserAccessing
  end

  def update
    @article = Article.find(params[:id])
    isCurrentUserAccessing
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    isCurrentUserAccessing
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
     def article_params
       params.require(:article).permit(:title, :body)
     end
     def authenticate_user
       if !Current.user
          redirect_to login_path
       end
     end
     def isCurrentUserAccessing
       if !(Current.user.id == @article.user.id)
          redirect_to root_path
       end
       
     end
end
