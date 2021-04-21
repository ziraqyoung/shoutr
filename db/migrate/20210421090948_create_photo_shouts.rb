class CreatePhotoShouts < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_shouts do |t|

      t.timestamps
    end
  end
end
