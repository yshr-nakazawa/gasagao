class ArticlesController < ApplicationController

  # 記事一覧
  def index
    @articles = Article.order(released_at: :desc)
  end

  # 記事詳細
  def show
    @article = Article.find(params[:id])
  end

  # 新規登録
  def new
    @article = Article.new
  end

  # 編集
  def edit
    @article = Article.find(params[:id])
  end

  # 新規作成
  def create
    @article = Article.new(params[:article])
    if  @article.save
      redirect_to @article, notice: "ニュース記事を登録しました。"
    else
      render "new"
    end
  end

  # 更新
  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(params[:article])
    if  @article.save
      redirect_to @article, notice: "ニュース記事を更新しました。"
    else
      render "edit"
    end
  end

  # 削除
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :articles
  end
end
