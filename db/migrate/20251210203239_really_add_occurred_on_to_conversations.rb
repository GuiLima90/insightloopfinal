class ReallyAddOccurredOnToConversations < ActiveRecord::Migration[7.1]
  def up
    # só adiciona se ainda não existir (pra evitar erro se rodar 2x)
    unless column_exists?(:conversations, :occurred_on)
      add_column :conversations, :occurred_on, :date

      execute <<~SQL
        UPDATE conversations
        SET occurred_on = DATE(created_at)
        WHERE occurred_on IS NULL;
      SQL

      change_column_null :conversations, :occurred_on, false
    end
  end

  def down
    # remove só se existir
    remove_column :conversations, :occurred_on if column_exists?(:conversations, :occurred_on)
  end
end
