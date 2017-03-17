class CreateMovedOutReasons < ActiveRecord::Migration
  def change
    create_table :legal_codes do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :legal_codes, :name, unique: true
  end
end
