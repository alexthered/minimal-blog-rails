class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_param)
      redirect_to @article
    else
      render 'articles/edit'
    end
  end
  
  def create
    @article = Article.new(article_param)
  
    if @article.save
      redirect_to @article
    else
      render 'articles/new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  
    redirect_to articles_path
  end
  
  protected
    def article_param
      params.require(:article).permit(:title, :text)
    end
end
