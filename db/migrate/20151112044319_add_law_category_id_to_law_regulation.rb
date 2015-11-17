class AddLawCategoryIdToLawRegulation < ActiveRecord::Migration
  def change
    add_reference :law_regulations, :law_category, index: true, foreign_key: true 
  end
end
