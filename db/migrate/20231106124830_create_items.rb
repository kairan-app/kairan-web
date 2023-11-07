class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :url, limit: 8000, null: false
      t.string :title, limit: 256
      t.string :description, limit: 1024
      t.string :image_url, limit: 8000

      t.timestamps
    end

    add_index :items, :url, unique: true
  end
end
