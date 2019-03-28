class Pokemon
attr_accessor :id, :name, :type, :db, :hp

    def initialize (id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save (name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    end

    def self.find (number, db)
        new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?",number).flatten
        pokemon_object = Pokemon.new(id:new_pokemon[0], name:new_pokemon[1], type:new_pokemon[2], db:db, hp:new_pokemon[3])
    end

    def alter_hp(num, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", num, self.id)
    end
end

