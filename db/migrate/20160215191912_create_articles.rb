class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :image_url
      t.date :published_date
      t.text :subtitle
      t.text :body
      t.string :category
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
