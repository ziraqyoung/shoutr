class MakeShoutPolymorphic < ActiveRecord::Migration[6.1]
  # defining them so that future migration wont affect the code changes in this file
  class Shout < ApplicationRecord
    belongs_to :content, polymorphic: true
  end
  class TextShout < ApplicationRecord; end

  def change
    change_table(:shouts) do |t|
      t.string :content_type
      t.integer :content_id
      t.index [:content_id, :content_type]
    end

    # migrate Shouts to TextShout
    reversible do |dir|
      Shout.reset_column_information
      Shout.find_each do |shout|
        dir.up do
          text_shout = TextShout.create body: shout.body
          shout.update content_id: text_shout.id, content_type: "TextShout"
        end
        dir.down do
          shout.update(body: shout.content.body)
          shout.content.destroy
        end
      end
    end

    # reversible migration
    remove_column :shouts, :body, :string
  end
end
