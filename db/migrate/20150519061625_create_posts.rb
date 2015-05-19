class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :artist
      t.string    :address 
      t.string    :caption
      t.timestamps
    end

    add_reference :posts, :user, index: true, foreign_key: true
  end
end