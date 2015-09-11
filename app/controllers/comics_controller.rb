class ComicsController < ApplicationController
	def index
	end

	def new
		@comic = Comic.new
	end

	def create
		@comic = Comic.new(comic_params)
		
	end

	private
	def comic_params
		params.require(:comic.permit[:title, :description])
	end
end
