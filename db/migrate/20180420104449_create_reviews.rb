class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text       :review, null: false
      t.integer    :rate, null: false
      t.references :product, null: false

      t.timestamps
    end
  end
end
