class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :taggable_id
      t.string :taggable_type

      t.timestamps
    end
    add_index :taggings, [:tag_id, :taggable_id, :taggable_type]

    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
    add_index :tags, :name
  end
end
