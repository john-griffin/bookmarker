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
end
