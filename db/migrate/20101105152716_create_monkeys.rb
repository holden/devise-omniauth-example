class CreateMonkeys < ActiveRecord::Migration
  def self.up
    create_table :monkeys do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :monkeys
  end
end
