class CreateModelWithNonDefaultLengthFields < ActiveRecord::Migration
  def change
    create_table :model_with_non_default_length_fields do |t|
      t.integer :foo

      t.timestamps
    end
  end
end
