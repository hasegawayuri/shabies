class CreateBpins < ActiveRecord::Migration[6.1]
  def change
    create_table :bpins do |t|
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
