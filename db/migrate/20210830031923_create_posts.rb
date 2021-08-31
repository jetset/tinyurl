class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :url
      t.string :tiny_url
      t.boolean :archived ,:default => false
      t.timestamps
    end
  end
end
