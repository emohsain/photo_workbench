class CreatePhotos < ActiveRecord::Migration[8.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.datetime :taken_at

      t.timestamps
    end
  end
end
