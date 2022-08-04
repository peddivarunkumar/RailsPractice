class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        #redirect_to article_path(@article)
        respond_to do |format|
        #   format.turbo_stream do 
        #       render turbo_stream: [
        #         turbo_stream.update('element_id',partial: )
        #       ]
        #   end
          format.html{redirect_to article_path(@article)}
          format.js
        end
    end
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article),status: 303
    end
    private
    def comment_params
        params.require(:comment).permit(:commentor,:body)
    end
end
