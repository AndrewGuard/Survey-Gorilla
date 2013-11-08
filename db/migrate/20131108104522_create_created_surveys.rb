class CreateCreatedSurveys < ActiveRecord::Migration
  def change
    create_table :created_surveys do |t|
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
