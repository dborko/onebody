class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.text :body
      t.string :author
      t.datetime :published_at
      t.integer :feed_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
