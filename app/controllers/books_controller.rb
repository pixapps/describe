class BooksController < ApplicationController

	before_action :set_book, only: [:show]


	def index
		@books = Book.all.order('created_at DESC')
	end

	def show

	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to book_path(@book), notice: "You have created a new book."
		else
			redirect_to :back, notice: "Book could not be created."
		end

	end

	private

	def book_params
		params.require(:book).permit(:name, :description)
	end

	def set_book
		@book = Book.find(params[:id])
	end

end