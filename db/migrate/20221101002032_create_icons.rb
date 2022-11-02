class CreateIcons < ActiveRecord::Migration[6.1]
  def change
    create_table :icons do |t|
      t.string :name
      t.binary :image

      t.timestamps
    end
  end
end
