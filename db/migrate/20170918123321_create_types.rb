class CreateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :types do |t|
      t.string :ad_type
      t.timestamps      
    end
  end
end
