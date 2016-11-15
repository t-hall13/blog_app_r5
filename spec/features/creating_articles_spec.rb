require "rails_helper"

RSpec.feature "Creating Articles" do
  scenario "A user creates a new Article" do
    #visit root page
    visit "/"
    #click on new article link
    click_link "New Article"
    #fill in title
    fill_in "Title", with: "Creating a Blog"
    #fill in body
    fill_in "Body", with: "Lorem Ipsum"
    #create article
    click_button "Create Article"
    
    #expectations
    #Article has been created
    expect(page).to have_content("Article has been created")
    #Articles path
    expect(page.current_path).to eq(articles_path)
  end
end