require "rails_helper"

RSpec.feature "Creating Articles" do
  
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
  end
  
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
    expect(Article.last.user).to eq(@john)
    expect(page).to have_content("Article has been created")
    #Articles path
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Created by: #{ @john.email }")
  end
  
  scenario "A user fails to create a new article" do
    #visit root page 
     visit "/"
    #click on new article link
    click_link "New Article"
    #fill in title
    fill_in "Title", with: ""
    #fill in body
    fill_in "Body", with: ""
    #create article
    click_button "Create Article"
    
    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
    
  end
end