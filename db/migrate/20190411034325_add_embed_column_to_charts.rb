class AddEmbedColumnToCharts < ActiveRecord::Migration[5.2]
  def change
    add_column :charts, :embed, :text
  end
end
