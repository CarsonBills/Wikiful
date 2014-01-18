class ArticlesController < ApplicationController
	def index
		@articles = Article.paginate(:page => params[:page], :per_page => 25)
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render "new"
		end
	end
	private
	def article_params
		params.require(:article).permit(:title, :content, :category_ids => [])
	end
end