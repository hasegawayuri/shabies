class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.integer :group_id
      t.binary :icon
      t.text :message
      t.binary :image
      t.integer :user_id

      t.timestamps
    end
  end
end
