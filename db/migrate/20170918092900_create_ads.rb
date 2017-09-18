class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image      
      t.timestamps
    end
  end
end
