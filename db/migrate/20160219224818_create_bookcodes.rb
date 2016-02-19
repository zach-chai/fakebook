class CreateBookcodes < ActiveRecord::Migration
  def change
    create_table :bookcodes do |t|
      t.text :code
      t.text :title
      t.text :format
      t.text :filename
      t.integer :page_offset

      t.timestamps null: false
    end
  end
end
