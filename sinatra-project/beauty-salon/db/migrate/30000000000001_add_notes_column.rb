class AddNotesColumn < ActiveRecord::Migration
    def change
        add_column :customers, :notes, :string
    end

end