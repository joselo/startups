class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.references :user
      t.string :name
      t.text :description
      t.string :twitter
      t.string :facebook
      t.string :url

      t.timestamps
    end
  end
end
