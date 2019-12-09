class CreateRecommandations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommandations do |t|
      t.string :email
      t.boolean :recommanded
      t.string :context

      t.timestamps
    end
  end
end
