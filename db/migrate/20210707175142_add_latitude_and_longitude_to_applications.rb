class AddLatitudeAndLongitudeToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :latitude, :float
    add_column :applications, :longitude, :float
  end
end
