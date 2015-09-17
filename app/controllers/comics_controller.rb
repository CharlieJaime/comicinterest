class ComicsController < ApplicationController
	before_action :find_comic, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, expect: [:index, :show]
	
	def index
		@comics = Comic.all.order('created_at DESC')
	end

	def show
		
	end

	def new
		@comic = current_user.comics.build
	end

	def create
		@comic = current_user.comics.build(comic_params)
		
		if @comic.save
			redirect_to @comic, notice: 'Successfully created new comic strip'
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @comic.update(comic_params)
			redirect_to @comic, notice: 'Comic Successfully updated'
		else
			render 'edit'
		end
	end

	def destroy
		@comic.destroy
		redirect_to root_path
	end

	def upvote
		@comic.upvote_by current_user
		redirect_to :back
	end

	private
	def comic_params
		params.require(:comic).permit(:title, :description, :image)
	end

	def find_comic
		@comic = Comic.find(params[:id])
	end
end
