class CreateCreations < ActiveRecord::Migration
  def self.up
    create_table :creations do |t|
      t.string :name
      t.integer :topic_id
      t.integer :user_id
      t.boolean :news
      t.integer :kind_id
      t.text :summary
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :creations
  end
end
