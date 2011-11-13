class AddPermalinkToStartup < ActiveRecord::Migration
  def change
    add_column :startups, :permalink, :string
  end
end
