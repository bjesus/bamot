class CreateExtfiles < ActiveRecord::Migration
  def self.up
    create_table :extfiles do |t|
      t.string :name
      t.text :path

      t.timestamps
    end
  end

  def self.down
    drop_table :extfiles
  end
end
