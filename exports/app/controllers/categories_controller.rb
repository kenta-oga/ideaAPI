class CategoriesController < ApplicationController
  def create
    @idea_category = IdeaCategory.new(idea_category_params)
    if @idea_category.save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def search
    unless Category.find_by(name: params[:category_name])
      render status: :not_found
      return
    end
    @ideas = search_idea(params[:category_name])
    @responses = []
    @ideas.each do |idea|
      response = { id: idea.id, category: idea.category.name, body: idea.body }
      @responses << response
    end
    render json: @responses, status: :created
  end

  private

  def idea_category_params
    params.require(:idea_category).permit(:name, :body)
  end

  def search_idea(category_name)
    if category_name != ''
      category = Category.find_by(name: category_name)
      Idea.where(category_id: category.id)
    else
      Idea.all
    end
  end
end
