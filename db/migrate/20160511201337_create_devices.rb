class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.integer :devise_type
      t.string :uuid

      t.timestamps null: false
    end
  end
end
