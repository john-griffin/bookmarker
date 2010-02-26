class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.string :url
      t.string :url_short
      t.string :title
      t.integer :site_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarks
  end
end
