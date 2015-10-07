class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	def index
	end
	def new
		@posts = Post.new
	end
	
	def create
		@posts = Post.new post_params

		if @posts.save
			redirect_to @posts, notice: "It saved!"
		else
			render 'new', notice: "Something went wrong!?!"
		end
	end

	def show
	end

	def edit
	end



	def update
		if @posts.update post_params
			redirect_to @posts, notice: "It was saved!"
		end
	end

	def destroy
		@posts.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:tile, :content, :slugged)
	end

	def find_post
		@posts = Post.friendly.find(params[:id,])
	end
	
end
