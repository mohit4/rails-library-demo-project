class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save  # article passes the validations
      flash[:notice] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
      # do something else
      render 'new' # go to create new article
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  private
    def article_params
      # white listing the variables for an article object
      params.require(:article).permit(:title, :description)
    end
  
end
