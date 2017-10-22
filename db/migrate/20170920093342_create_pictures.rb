# frozen_string_literal: true

#
class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :image_src
      t.belongs_to :ad, foreign_key: true

      t.timestamps
    end
  end
end
