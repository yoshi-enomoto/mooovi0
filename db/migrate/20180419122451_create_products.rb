class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text   :image_url, null: false
      t.string :director, null: false
      t.text   :detail, null: false
      t.string :open_date, null: false

      t.timestamps
    end
  end
end
