describe "book creation" do


	it "allows creation of a new book" do
		visit root_path
		click_link "Create new book"

		fill_in "Name", with: "The Firm"
		fill_in "Description", with: "John Grisham's Crime Thriller"

		click_button "Create Book"

		expect(page).to have_text "You have created a new book."
		expect(page).to have_text "The Firm"
	end

	it "does not allow blank fields" do
		expect(Book.count).to eq(0)

		visit root_path
		click_link "Create new book"

		fill_in "Name", with: ""
		fill_in "Description", with: ""

		click_button "Create Book"

		expect(page).to have_text "Book could not be created."
		expect(page).to have_text "Create new book"
		expect(Book.count).to eq(0)
	end


end