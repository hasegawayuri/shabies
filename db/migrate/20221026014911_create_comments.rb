class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :board_id
      t.text :message
      t.string :user_id
      t.string :integer
      t.binary :image

      t.timestamps
    end
  end
end
