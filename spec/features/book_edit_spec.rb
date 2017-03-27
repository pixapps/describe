describe "book edit" do
	def edit_book(options={})
		book = create(:book)

		options[:name] ||= "Edited name"
		options[:description] ||= "Edited description"

		visit root_path

		click_link book.name
		page.find("h1", text: book.name)

		click_link "Edit Book"

		page.find("h1", text: "Edit #{book.name}")

		fill_in "Name", with: options[:name]
		fill_in "Description", with: options[:description]
		click_button "Update Book"
	end

	it "updates books successfully with correct entries" do
		edit_book

		expect(page).to have_text "You have successfully updated the book."
		expect(page).to have_text "Edited name"
	end

	it "doesn't update books with incorrect entries" do
		edit_book name: "", description: ""

		expect(page).to have_text "Book could not be updated."
	end
end