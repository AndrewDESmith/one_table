class CreateRecipesTable < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string   :title
      t.text     :body
      t.string   :country
      t.datetime :created_at
      t.datetime :updated_at
    end

    change_column :users, :administrator, :boolean, :default => false
  end

  def self.down
    change_column :users, :administrator, :boolean, default: false

    drop_table :recipes
  end
end
