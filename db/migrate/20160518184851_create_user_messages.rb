class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.integer :user_id
      t.integer :message_id
      t.boolean :read, default: false, null: false

      t.timestamps null: false
    end
  end
end
