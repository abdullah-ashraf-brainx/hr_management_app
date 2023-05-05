class RenameJobDetailsToDetails < ActiveRecord::Migration[7.0]
  def change
    rename_column :hiring_positions, :job_details, :details
  end
end
