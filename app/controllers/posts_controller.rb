class PostsController < ApplicationController
	before_action :find_forum 
	before_action :find_post, :only => [:show, :edit, :update, :destroy]

	def new
		@post = Post.new
	end

	def create
		if @forum.present?
			@post = @forum.posts.build(post_params)
			@post.user_id = current_user.id
			if @post.valid? && @post.save!
				flash[:success]	=	"post Created Successfully!"
			else
				flash[:error] = @post.errors.messages
			end
		else
			flash[:error] = "Forum is not present"
		end
		redirect_to forum_path(@forum)
	end

	def show
		@comment = Comment.new
		@comments = @post.comments.where(:is_archived => false)
	end

	def edit
	end

	def update
		if @post.present?
			@post.update_attributes(post_params)
		end
		redirect_to forum_path(@forum)
	end

	def destroy
		@forum = Forum.find_by_id(params[:forum_id])
		@post = @forum.posts.find_by_id(params[:id])
		if @post.present?
			@post.update_attribute(:is_archived, true)
		end
		redirect_to forum_path(@forum)
	end

	private

	def post_params
		params.require(:post).permit(:name, :content)
	end

	def find_forum
		@forum = Forum.find_by_id(params[:forum_id])
	end

	def find_post
		@post = @forum.posts.find_by_id(params[:id])
	end

end