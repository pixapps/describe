class BooksController < ApplicationController

	before_action :set_book, only: [:show, :edit, :update, :destroy]


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
			redirect_back(fallback_location: root_path)
			flash[:error] = "Book could not be created."
		end

	end

	def edit

	end

	def update
		if @book.update(book_params)
			redirect_to book_path(@book), notice: "You have successfully updated the book."
		else
			redirect_back(fallback_location: root_path)
			flash[:error] = "Book could not be updated."
		end
	end

	def destroy
		if @book.destroy
			redirect_to books_path, notice: "You have successfully deleted the book."
		else
			redirect_back(fallback_location: root_path)
			flash[:error] = "Book could not be deleted."
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