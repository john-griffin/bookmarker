require 'spec_helper'

describe "/sites/index" do
  before(:each) do
    site = mock_model(Site)
    bookmark = mock_model(Bookmark)
    bookmark.should_receive(:count).and_return(1)
    site.should_receive(:url).and_return("www.google.com")
    site.should_receive(:bookmarks).and_return(bookmark)
    assigns[:sites] = [site]
    render 'sites/index'
  end

  it "should have a bookmark button" do
    response.should have_tag('a', %r[Bookmark something!])
  end
end
