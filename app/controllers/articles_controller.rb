class ArticlesController < ApplicationController
    before_action :authenticate_user!
    def new
        @name = params['name']
        @article = Article.new
        
    end
    def edit
        @article = Article.find(params[:id])
        authorize! :update, @article
        authorize! :read, @article
    end
    def create
        # @article = Article.new(article_params)
        @article=current_user.articles.build(article_params)
        if @article.save
            redirect_to articles_path
          else
            render 'new'
          end
    end
    def index
        @articles=Article.all
        # render json: @articles
    end
    def show
        @article = Article.find(params[:id])
        authorize! :read, @article

    end
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          redirect_to articles_path
        else
          render 'edit'
        end
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to articles_path
    end
    def delete_all
        Article.destroy_all
        redirect_to articles_path
    end
    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
    

end
