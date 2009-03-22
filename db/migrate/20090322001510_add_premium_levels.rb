class AddPremiumLevels < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.boolean :prem_lev1
      t.datetime :lev1_expire
      t.boolean :prem_lev2
      t.datetime :lev2_expire
      t.boolean :prem_lev3
      t.datetime :lev3_expire
      t.boolean :prem_lev4
      t.datetime :lev4_expire
  end
  end

  def self.down
    change_table :people do |t|
      t.remove :prem_lev1
      t.remove :lev1_expire
      t.remove :prem_lev2
      t.remove :lev2_expire
      t.remove :prem_lev3
      t.remove :lev3_expire
      t.remove :prem_lev4
      t.remove :lev4_expire
  end
  end
end
