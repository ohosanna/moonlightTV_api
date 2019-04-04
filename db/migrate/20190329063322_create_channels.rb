class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name
      t.references :live_group, foreign_key: true

      t.timestamps
    end
  end
end
