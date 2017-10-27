# frozen_string_literal: true

#
class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.integer :user_id
      t.integer :type_id
      t.string :state, :access_state
      t.string :title, index: true
      t.text :body, index: true
      t.string :image

      t.timestamps
    end
    add_index :ads, "to_tsvector('english', title || ' ' || body)", using: :gin, name: 'ads_idx'
  end
end
