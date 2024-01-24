class MoveBodyToActionText < ActiveRecord::Migration[7.1]
  def change
    Post.all.find_each do |p|
      p.update(content: p.body)

    end
    remove_column :posts, :body
  end
end
