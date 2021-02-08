class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.integer :user_id
      t.integer :blog_id
      t.text :text
      t.timestamps
    end
  end
end
