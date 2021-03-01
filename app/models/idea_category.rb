class IdeaCategory
  include ActiveModel::Model
  attr_accessor :name, :body

  with_options presence: true do
    validates :name
    validates :body
  end

  def save
    category = Category.create(name: name)
    Idea.create(body: body, category_id: category.id)
  end
end