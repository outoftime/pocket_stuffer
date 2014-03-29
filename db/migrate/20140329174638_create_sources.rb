class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :type, null: false
      t.references :user, null: false
      t.string :title, null: false
      t.string :locator, null: false
      t.string :web_url
      t.timestamps
      t.timestamp :synced_at
    end
    add_index :sources, [:user_id, :locator], unique: true
  end
end
