class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.text :heading
      t.text :content
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
