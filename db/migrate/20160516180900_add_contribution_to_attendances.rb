class AddContributionToAttendances < ActiveRecord::Migration
  def change
  add_column :attendances, :contribution, :string
  end
end
