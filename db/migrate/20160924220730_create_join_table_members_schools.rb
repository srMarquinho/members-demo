class CreateJoinTableMembersSchools < ActiveRecord::Migration[5.0]
  def change
    create_join_table :members, :schools do |t|
      t.index [:member_id, :school_id]
      t.index [:school_id, :member_id]
    end
  end
end
