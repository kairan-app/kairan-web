class CreateAppPasswords < ActiveRecord::Migration[7.1]
  def change
    create_table :app_passwords do |t|
      t.references :user, foreign_key: true
      t.string :token, null: false
      t.datetime :last_used_at

      t.timestamps
    end

    add_index :app_passwords, :token, unique: true
  end
end
