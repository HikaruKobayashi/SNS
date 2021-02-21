class AddLinkToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :link, :string
  end
end
