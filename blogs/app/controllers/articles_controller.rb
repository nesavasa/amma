class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
 
    def index
      @articles = Article.all
    end
 
    # snipped for brevity
    
  def new
    @article = Article.new
  end
 
  def index
    @articles = Article.all
  end  
  ############CREATE############################
  def create
      @article = Article.new(article_params)
 
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  ############SHOW##############################
  def show
    @article = Article.find(params[:id])
  end
  #############EDIT#############################
  def edit
    @article = Article.find(params[:id])
  end
  ############UPDATE############################
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  #################DESTROY#######################
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
  #####################################################################
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end   
end
