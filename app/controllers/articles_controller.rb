class ArticlesController < ApplicationController

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed.", status: :see_other
  end

  private
    
    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
