class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :website
      t.string :avatar_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
