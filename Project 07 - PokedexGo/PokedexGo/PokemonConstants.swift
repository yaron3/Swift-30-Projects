//
//  PokemonConstants.swift
//  PokedexGo
//
//  Created by Yi Gu on 7/10/16.
//  Copyright © 2016 yigu. All rights reserved.
//

import Foundation

let pokemons = [
  Pokemon(name: "Bulbasaur", id: 1,
    detailInfo: "Bulbasaur often naps in the sunshine. There is a seed on its back that grows larger by soaking up the sun's rays.",
    type: [PokeType.grass, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.ice, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png"),
  
  Pokemon(name: "Ivysaur", id: 2,
    detailInfo: "There is a bud on its back. Ivysaur’s legs are strong enough to support its weight. When it starts spending more time in the sun, it means it is close to blooming.",
    type: [PokeType.grass, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.ice, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png"),
  
  Pokemon(name: "Venusaur", id: 3,
    detailInfo: "Venusaur has a large flower on its back. The flower’s color becomes more vivid if it absorbs enough nutrients and sunlight. The flower’s fragrance soothes people who are feeling down.",
    type: [PokeType.grass, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.ice, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/003.png"),
  
  Pokemon(name: "Charmander", id: 4,
    detailInfo: "The flame on its tail shows its emotions. It waves gently when Charmander is happy, and burns fiercely when it is angry.",
    type: [PokeType.fire],
    weak: [PokeType.ground, PokeType.rock, PokeType.water],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png"),
  
  Pokemon(name: "Charmeleon", id: 5,
    detailInfo: "Charmeleon mercilessly tears its enemies apart with its sharp claws. If it encounters a strong opponent, it becomes aggressive. In that case, the flame on its tail burns with a whitish-blue color.",
    type: [PokeType.fire],
    weak: [PokeType.ground, PokeType.rock, PokeType.water],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/005.png"),
  
  Pokemon(name: "Charizard", id: 6,
    detailInfo: "Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never targets weaker foes.",
    type: [PokeType.fire, PokeType.flying],
    weak: [PokeType.ground, PokeType.electric, PokeType.water],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png"),
  
  Pokemon(name: "Squirtle", id: 7,
    detailInfo: "Squirtle’s shell is not merely used for protection. Its rounded shape and the grooves on its surface help reduce water resistance, enabling it to swim at high speeds.",
    type: [PokeType.water],
    weak: [PokeType.electric, PokeType.grass],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png"),

  Pokemon(name: "Wartortle", id: 8,
    detailInfo: "Its fluffy tail darkens in color with age. The scars on its shell are evidence of its toughness.",
    type: [PokeType.water],
    weak: [PokeType.electric, PokeType.grass],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/008.png"),
  
  Pokemon(name: "Blastoise", id: 9,
    detailInfo: "Blastoise has water cannons that protrude from its shell. They can shoot water bullets with excellent accuracy, hitting empty cans from over 50 meters away.",
    type: [PokeType.water],
    weak: [PokeType.electric, PokeType.grass],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/009.png"),
  
  Pokemon(name: "Caterpie", id: 10,
    detailInfo: "It has a voracious appetite, capable of devouring leaves bigger than itself in an instant. Its antennae release a strong stench.",
    type: [PokeType.bug],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/010.png"),
  
  Pokemon(name: "Metapod", id: 11,
    detailInfo: "The shell covering its body is as hard as iron. It doesn’t move much because it’s preparing for evolution with its soft inner body.",
    type: [PokeType.bug],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/011.png"),
  
  Pokemon(name: "Butterfree", id: 12,
    detailInfo: "Butterfree has an excellent ability to find tasty flower nectar. It can locate blooming flowers even from 10 kilometers away and bring back the nectar.",
    type: [PokeType.bug, PokeType.flying],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock, PokeType.electric, PokeType.ice],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/012.png"),
  
  Pokemon(name: "Weedle", id: 13,
    detailInfo: "It has a very sensitive sense of smell. Using its large red nose, it can sniff out its favorite leaves even among unpleasant-smelling ones.",
    type: [PokeType.bug, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/013.png"),
  
  Pokemon(name: "Kakuna", id: 14,
    detailInfo: "It hangs from trees and hardly moves, busy preparing for evolution. Its body gradually heats up as evidence.",
    type: [PokeType.bug, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/014.png"),
  
  Pokemon(name: "Beedrill", id: 15,
    detailInfo: "Beedrill has a strong sense of territory. It won’t let anyone approach its nest and will attack in swarms if angered.",
    type: [PokeType.bug, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/015.png")
]
