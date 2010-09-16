class CreateGarins < ActiveRecord::Migration
  def self.up
    create_table :garins do |t|
      t.string :name
      t.integer :grade_id

      t.timestamps
    end
  end

  def self.down
    drop_table :garins
  end
end
