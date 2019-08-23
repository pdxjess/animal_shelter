class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :sex
      t.datetime :birthday
      t.string :description
      t.datetime :arrival_date

      t.timestamps
    end
  end
end
