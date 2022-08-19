class CommentsController < ApplicationController
  before_action :rightUser, only: [:destroy]
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(comment_params)
        @comment.user_id = session[:user_id]
        @comment.article_id = params[:article_id]
        @comment.save
        #redirect_to article_path(@article)
        respond_to do |format|
          format.turbo_stream
          format.html{redirect_to article_path(@article)}
          format.js
        end
    end
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        
        respond_to do |format|
          format.turbo_stream
          format.html{redirect_to article_path(@article)}
          format.js
       
        end
        
    end
    private
    def rightUser
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      if Current.user.id != @comment.user.id
        redirect_to root_path
      end
    end
    def comment_params
        params.require(:comment).permit(:body)
    end
    
end
