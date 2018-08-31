class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :author
      t.date :date
      t.text :body

      t.timestamps
    end
  end
end
