require "pry"
class Pokemon
  attr_accessor :id ,:name, :type, :db
  @@all = []
  
  def initialize(id:,name:,type:, db:)
    @id = id
    @name = name 
    @type = type
    @db = db
    @@all << self
  end
  def self.find(number, db)
    pokemon_by_id = db.execute("SELECT * FROM pokemon WHERE id = ?", [number])
#binding.pry
    
    id = pokemon_by_id[0][0]
    name = pokemon_by_id[0][1]
    type = pokemon_by_id[0][2]
    new_pokemon = Pokemon.new(id:id,name:name,type:type,db:db)
   #binding.pry
    return new_pokemon
   # binding.pry
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
end