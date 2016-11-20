require 'rails_helper'
RSpec.feature 'Deleting an Article' do
  
  before do 
    @article = Article.create(title: "Article One", body: "Body of Article One")
  end
  
  scenario "A user deletes an Article" do
    visit "/"
    click_link @article.title
    click_link "Delete Article"
    
    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end
end