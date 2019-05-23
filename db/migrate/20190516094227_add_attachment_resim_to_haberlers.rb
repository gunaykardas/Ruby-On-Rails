class AddAttachmentResimToHaberlers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :haberlers do |t|
      t.attachment :resim
    end
  end

  def self.down
    remove_attachment :haberlers, :resim
  end
end
