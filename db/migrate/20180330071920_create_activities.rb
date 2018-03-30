class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :verb
      t.string :object
      t.integer :post_id
      t.integer :share_id
      t.string :actor
      t.timestamps
    end
  end
end
