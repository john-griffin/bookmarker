class BookmarksController < ApplicationController
  def index
    if params[:search]
      @bookmarks = Bookmark.all(:conditions => ['title like ?', "%"+params[:search]+"%"])
    else
      @bookmarks = Site.find(params[:site_id]).bookmarks
    end
  end

  def new
    @bookmark = Bookmark.new
  end
  
  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])
    if @bookmark.save
      render :action => "edit"
    else
      render :action => "new"
    end
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(params[:bookmark])
      redirect_to(site_bookmarks_url(@bookmark.site))
    else
      render :action => "edit"
    end
  end
  

end
