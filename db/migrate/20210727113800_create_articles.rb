class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.string :author
      t.boolean :is_hidden

      t.timestamps
    end
  end
end
