class CreateMarks < ActiveRecord::Migration[7.1]
  def change
    create_table :marks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end

    add_index :marks, %i[user_id item_id], unique: true
  end
end
