require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db
 
    def initialize(id:, name:, type:, db:, hp: 60)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save (name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        select_arr = db.execute("SELECT * FROM pokemon WHERE id = id;").flatten
        Pokemon.new(id: select_arr[0], name: select_arr[1], type: select_arr[2], db: db)
    end

    def alter_hp(hp, db)
        db.execute("UPDATE pokemon SET hp = hp WHERE id = ?;", self.id)
    end
end
