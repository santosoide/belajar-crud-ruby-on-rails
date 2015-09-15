class ArticlesController < ApplicationController

  # show list the article
  def index
    @articles = Article.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  # show article by param :id
  def show
    @article = Article.find(params[:id])
  end

  # show form create
  def new
    @article = Article.new
  end

  # show edit form
  def edit
    @article = Article.find(params[:id])
  end

  # store new data
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # update data
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # delete data
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
