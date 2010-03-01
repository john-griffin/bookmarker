require 'spec_helper'

describe Bookmark do
  before(:each) do
    @valid_attributes = {
      :url => "http://www.google.com/"
    }
  end

  it "should create a new instance given valid attributes" do
    Bookmark.create!(@valid_attributes)
  end
  
  it "empty search should return nothing" do
    assert_equal([], Bookmark.search("", ["title", "url"]))
    assert_equal([], Bookmark.search(nil, ["title", "url"]))
  end
  
  it "searching should bring results back against all fields passed in" do
    bookmark1 = Bookmark.create!(:url => "http://www.apple.com/ipad/")
    bookmark2 = Bookmark.create!(:url => "http://www.macrumors.com/2010/03/01/ipad-supplies-to-be-constrained-at-launch-due-to-production-issues/")
    bookmark3 = Bookmark.create!(:url => "http://www.bbc.co.uk/iplayer/")
    results = Bookmark.search("ipad", ["title", "url"])
    assert_equal(true, results.include?(bookmark1))
    assert_equal(true, results.include?(bookmark2))
    assert_equal(false, results.include?(bookmark3))
    assert_equal(2, results.length)
  end
end
