class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.datetime :date
      t.float :distance
    end
  end
end
