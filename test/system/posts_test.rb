require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "lazy loading comments on post" do
    visit post_url(Post.first)
    
    execute_script('window.scrollTo(0,100000)') #scroll to the bottom of the page
    assert_selector "h2", text: 'New comment'
  end
end
