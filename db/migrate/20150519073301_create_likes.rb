class CreateLikes < ActiveRecord::Migration
  def change
    create_table   :likes do |t|
      t.integer    :rating
      t.timestamps null: false
    end
    add_reference  :likes, :user, index: true, foreign_key: true
    add_reference  :likes, :post, index: true, foreign_key: true
  end
end
