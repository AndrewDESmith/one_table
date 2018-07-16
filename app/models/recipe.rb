class Recipe < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title   :string
    body    :text
    timestamps
  end
  attr_accessible :title, :body, :country_id, :country, :categories, :category_ids

  belongs_to :country
  has_many :categories, through: :category_assignments, accessible: true
  has_many :category_assignments, dependent: :destroy

  # Tell Hobo to display related information (for this model) on the recipe show page:
  children :categories

  validates_presence_of :country

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.signed_up?
  end

  def view_permitted?(field)
    true
  end

end

