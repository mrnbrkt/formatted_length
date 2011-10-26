class CreateModelWithDefaultLengthFields < ActiveRecord::Migration
  def change
    create_table :model_with_default_length_fields do |t|
      t.integer :length

      t.timestamps
    end
  end
end
