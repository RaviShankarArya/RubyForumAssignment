class ForumsController < ApplicationController

	def new
		@forum = Forum.new
	end

	def create
		@forum = Forum.new(forum_params)
		@forum.user_id = current_user.id
		if @forum.valid? && @forum.save!
			flash[:success]	=	"Forum Created Successfully!"
		else
			flash[:error] = @forum.errors.messages
		end
		redirect_to forums_url
	end

	def index
		@forums = Forum.order('id ASC')
	end

	def show
		@forum = Forum.find_by_id(params[:id])
		@posts = @forum.posts.where(:is_archived => false )
	end

	private

	def forum_params
		params.require(:forum).permit(:name, :description)
	end
end