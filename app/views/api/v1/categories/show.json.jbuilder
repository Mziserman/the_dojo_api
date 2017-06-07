json.partial! 'category.json', category: @category
json.sub_categories @category.sub_categories, partial: 'api/v1/sub_categories/sub_categories.json', as: :sub_category 