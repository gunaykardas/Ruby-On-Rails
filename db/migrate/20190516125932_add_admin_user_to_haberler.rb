class AddAdminUserToHaberler < ActiveRecord::Migration[5.2]
  def change
    add_reference :haberlers, :AdminUser, foreign_key: true
  end
end
