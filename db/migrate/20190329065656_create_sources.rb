class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :url
      t.references :sourceable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
