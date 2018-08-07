class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredient_1 = @recipe.ingredients.build
    @ingredient_2 = @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipes_path(@recipe)
  end
end

private

def recipe_params
  params.require(:recipe).permit(
    :title,
    ingredients_attributes: [
      :name,
      :quantity
    ]
  )
end
