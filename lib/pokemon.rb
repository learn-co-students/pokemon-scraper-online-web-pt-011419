class Pokemon

  attr_accessor :id, :name, :type, :db
  @@all = []

 def initialize(keywords)
   @id = id
   @name = name
   @type = type
   @db = db
   @@all << self
 end

 def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
 end

 def self.find(index, db)
   pokemon = db.execute("SELECT * FROM pokemon WHERE id=#{index}")
   new_pokemon = Pokemon.new(pokemon)
   #new_pokemon.id = db.execute("SELECT id FROM pokemon WHERE id=#{index}")
   new_pokemon.id = pokemon[0][0]
   new_pokemon.name = pokemon[0][1]
   new_pokemon.type = pokemon[0][2]
   new_pokemon
 end

end
