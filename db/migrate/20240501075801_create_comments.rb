class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :gossip, index: true
      t.text :description
      t.timestamps
    end
  end
end
