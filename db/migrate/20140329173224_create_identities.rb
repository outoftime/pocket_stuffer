class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :type, null: false
      t.references :user, null: false
      t.string :uid, null: false
      t.string :auth_token, null: false
      t.string :auth_secret
      t.timestamps null: false
    end
    add_index :identities, :user_id
    add_index :identities, [:type, :uid], unique: true
  end
end
