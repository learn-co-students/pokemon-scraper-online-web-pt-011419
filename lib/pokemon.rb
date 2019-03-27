require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db, :hp
 
    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save (name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        select_arr = db.execute("SELECT * FROM pokemon WHERE id = id;").flatten
        Pokemon.new(id: select_arr[0], name: select_arr[1], type: select_arr[2], hp: select_arr[3], db: db)
    end

    def alter_hp(altered_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", altered_hp, self.id)
    end
end
