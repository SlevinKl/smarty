class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :content
      t.boolean :read, default: false
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
