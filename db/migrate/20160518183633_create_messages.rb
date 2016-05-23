class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id, foreign_key: { references: [:users, :id] }, null: false
      t.text :body

      t.timestamps null: false
    end
  end
end
