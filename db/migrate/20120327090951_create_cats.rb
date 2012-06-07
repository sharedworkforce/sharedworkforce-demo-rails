class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.text :description
      t.text :improved_description
      t.text :tags
      t.text :image_url
      t.text :rotated_image_url
      t.text :cropped_image_url
      t.boolean :rejected
      t.timestamps
    end
  end
end
