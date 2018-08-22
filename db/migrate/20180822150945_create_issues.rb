class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :status
      t.text :owner
      t.text :created
      t.text :completion
      t.text :title
      t.integer :support_id

      t.timestamps null: false
    end
  end
end
