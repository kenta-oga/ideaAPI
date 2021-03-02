class IdeaCategory
  include ActiveModel::Model
  attr_accessor :name, :body

  validates :name, presence: true
  validates :body, presence: true

  def save
    if Category.exists?(name: name)
      category = Category.find_by(name: name)
      Idea.create(body: body, category_id: category.id)
    else
      category = Category.create(name: name)
      Idea.create(body: body, category_id: category.id)
    end
  end
end
