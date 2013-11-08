class CreatePossibleChoices < ActiveRecord::Migration
  def change
    create_table :possible_choices do |t|
      t.integer :question_id
      t.string :text

      t.timestamps
    end
  end
end
