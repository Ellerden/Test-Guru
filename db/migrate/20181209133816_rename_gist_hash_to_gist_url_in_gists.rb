class RenameGistHashToGistUrlInGists < ActiveRecord::Migration[5.2]
  def change
    rename_column :gists, :gist_hash, :gist_url
  end
end
