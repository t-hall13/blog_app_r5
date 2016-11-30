require 'rails_helper'
RSpec.feature "Adding comments to Articles" do
  before do 
    @john = User.create(email: "john@example.com", password: "password")
    @paul = User.create(email: "paul@example.com", password: "password")
    @article = Article.create!(title: "Article One", body: "Body of Article One", user: @john)
  end
  
  scenario "Permits a signed in user to write a comment" do
    login_as(@paul)
    
    visit "/"
    click_link @article.title
    fill_in "New Comment", with: "Great stuff!"
    click_button "Add Comment"
    
    expect(page).to have_content("Comment has been created")
    expect(page).to have_content("Great stuff!")
    expect(current_path).to eq(article_path(@article.id))
  end
end