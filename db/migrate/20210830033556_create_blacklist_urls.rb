class CreateBlacklistUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :blacklist_urls do |t|
      t.string :url
      t.string :source
      t.boolean :active ,:default => true

      t.timestamps
    end
  end
end
