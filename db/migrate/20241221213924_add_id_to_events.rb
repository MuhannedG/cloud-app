class AddIdToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :id, :primary_key
  end
end
