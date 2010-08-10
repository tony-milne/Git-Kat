class AddTribes < ActiveRecord::Migration
  def self.up
    tribes =
      [ "Aborigines", "Akuntsu", "Arhuaco", "Awá", "Ayoreo", "Batak", "Brazilian Indians", "Bushmen",
      "Dongria Kondh", "Enawene Nawe", "Enxet", "Guarani", "Indians of Raposa-Serra do Sol", "Innu",
      "Jarawa", "Jummas", "Kanty", "Maasai", "Nukak", "Ogiek", "Omo Valley Tribes", "Palawan",
      "Papuan Tribes", "Penan", "Pygmies", "Siberian Tribes", "Uncontacted Indians of Brazil",
      "Uncontacted Indians of Peru", "Wanniyala-Aetto", "Wichi", "Yanomami" ]

    tribes.each do |t|
      Tribe.new(:name => t).save
    end
  end

  def self.down
    Tribe.destroy_all
  end
end

