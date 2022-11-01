class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :mailaddress
      t.string :password_digest
      t.string :name
      t.text :hobby
      t.integer :age
      t.text :introduction
      t.binary :icon

      t.timestamps
    end
  end
end
