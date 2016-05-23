class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :access_token
      t.string :refresh_token
      t.datetime :expired_at
      t.integer :device_id

      t.timestamps null: false
    end
  end
end
