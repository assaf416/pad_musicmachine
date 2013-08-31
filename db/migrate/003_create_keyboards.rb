class CreateKeyboards < ActiveRecord::Migration
  def self.up
    create_table :keyboards do |t|
      t.string :name
      t.string :picture_url
      t.string :maker
      t.boolean :used
      t.text :midi_leared_keys
      t.boolean :has_faders
      t.boolean :has_wheel
      t.boolean :has_pads
      t.timestamps
    end
  end

  def self.down
    drop_table :keyboards
  end
end
