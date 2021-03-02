class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # POST /categories
  def create
    @idea_category = IdeaCategory.new(idea_category_params)
    if @idea_category.save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def search
    @ideas = search_idea(params[:category_name])
    render json: @ideas
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def idea_category_params
      params.require(:idea_category).permit(:name, :body)
    end

    def search_idea(category_name)
      if category_name != ""
        if category = Category.find_by(name: category_name)
          Idea.where(category_id: category.id)
        else
          nil
        end
      else
        Idea.all
      end
    end
end
