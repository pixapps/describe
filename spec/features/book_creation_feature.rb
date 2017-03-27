describe "book creation" do

	def create_book(options={})
		options[:name] ||= "War and Peace"
		options[:description] ||= "Leo Tolstoy's epic"

		visit root_path
		click_link "Create new book"

		fill_in "Name", with: options[:name]
		fill_in "Description", with: options[:description]
		click_button "Create Book"
	end

	it "allows creation of a new book" do
		create_book

		expect(page).to have_text "You have created a new book."
		expect(page).to have_text "War and Peace"
	end

	it "does not allow blank fields" do
		expect(Book.count).to eq(0)

		create_book name: "", description: ""

		expect(page).to have_text "Book could not be created."
		expect(page).to have_text "Create new book"
		expect(Book.count).to eq(0)
	end
end
