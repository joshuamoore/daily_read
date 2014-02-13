class RenamePassageTextToContent < ActiveRecord::Migration
  def change
    rename_column :passages, :text, :content
  end
end
