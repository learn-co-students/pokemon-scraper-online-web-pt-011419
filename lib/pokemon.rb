class Pokemon
    attr_accessor = :id, :name, :type, :db
    #database_connection = SQLite3::Database.new('db/pokemon.db')

    def initialize(id, name, type, db)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    def save(name, type, db)

    end
end
