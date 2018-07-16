class Category < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end
  attr_accessible :name, :recipes, :recipe_ids

  has_many :recipes, through: :category_assignments
  has_many :category_assignments, dependent: :destroy

  # Tell Hobo to display related information (for this model) on the category show page:
  children :recipes

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
