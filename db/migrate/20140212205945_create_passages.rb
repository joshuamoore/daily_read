class CreatePassages < ActiveRecord::Migration
  def change
    create_table :passages do |t|
      t.string :name
      t.text :text
      t.datetime :read_on

      t.timestamps
    end
  end
end
