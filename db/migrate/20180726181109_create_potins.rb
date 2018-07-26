class CreatePotins < ActiveRecord::Migration[5.2]
  def change
    create_table :potins do |t|
      t.belongs_to :city, index: true
      t.belongs_to :user, index: true
      t.string :title
      t.text :content
      t.timestamp :date

      t.timestamps
    end
  end
end
