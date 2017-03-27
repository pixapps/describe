describe "book destroy" do
	it "is successful when clicking delete button" do
		book = create(:book)

		expect(Book.count).to eq(1)

		visit root_path

		click_link book.name
		page.find("h1", text: book.name)

		click_link "Delete Book"
		expect(page).to_not have_content book.name
		expect(Book.count).to eq(0)
	end
end
