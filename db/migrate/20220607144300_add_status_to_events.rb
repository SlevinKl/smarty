class AddStatusToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :status, :string, default: "before_ocr"
  end
end
