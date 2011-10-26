class CreateModelWithLengthFieldAndSetters < ActiveRecord::Migration
  def change
    create_table :model_with_length_field_and_setters do |t|
      t.integer :length

      t.timestamps
    end
  end
end
