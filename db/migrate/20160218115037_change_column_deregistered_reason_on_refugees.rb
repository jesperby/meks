class ChangeColumnDeregisteredReasonOnRefugees < ActiveRecord::Migration
  def change
    change_table :refugees do |t|
      t.remove :deregistered_reason
      t.references :deregistered_reason, index: true, foreign_key: true
    end
  end
end
