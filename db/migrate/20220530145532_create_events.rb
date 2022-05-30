class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :venue
      t.datetime :starts_at
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :category
      t.boolean :identity_card, default: false
      t.boolean :driver_card, default: false
      t.boolean :passport, default: false

      t.timestamps
    end
  end
end
