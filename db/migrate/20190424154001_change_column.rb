class ChangeColumn < ActiveRecord::Migration[5.2]
  def self.up
    change_column :books, :ISBN, :string
  end
   
  def self.down
    change_column :books, :ISBN, :integer
  end
end
