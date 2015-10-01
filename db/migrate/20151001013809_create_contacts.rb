class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.strign :email
      t.text :comments
      
      t.timestamp
    end
  end
end
