require "pry"

class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(number, db) 
    pokemon_by_id = db.execute("SELECT * FROM pokemon WHERE id = ?",number).flatten
    
    id = pokemon_by_id[0]
    name = pokemon_by_id[1]
    type = pokemon_by_id[2]
    
    new_pokemon = Pokemon.new(id:id, name:name, type:type, db:db)
    
    return new_pokemon
  end
  
end
