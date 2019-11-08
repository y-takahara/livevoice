class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.datetime       :event_date
      t.string         :artist, null: false
      t.string         :venue
      t.text           :text, null: false
      t.string         :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
