//
//  PokemonConstants.swift
//  PokedexGo
//
//  Created by Yi Gu on 7/10/16.
//  Copyright © 2016 yigu. All rights reserved.
//

import Foundation

let pokemons = [
  Pokemon(id: 1, name: "Bulbasaur",
    detailInfo: "Bulbasaur often naps in the sunshine. There is a seed on its back that grows larger by soaking up the sun's rays.",
    type: [PokeType.grass, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.ice, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
    stats: [
        Stat(name: "hp", value: 45),
        Stat(name: "attack", value: 49),
        Stat(name: "defense", value: 49),
        Stat(name: "special-attack", value: 65),
        Stat(name: "special-defense", value: 65),
        Stat(name: "speed", value: 45)
    ]),
  
  Pokemon(id: 2, name: "Ivysaur",
    detailInfo: "There is a bud on its back. Ivysaur's legs are strong enough to support its weight. When it starts spending more time in the sun, it means it is close to blooming.",
    type: [PokeType.grass, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.ice, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png",
    stats: [
        Stat(name: "hp", value: 60),
        Stat(name: "attack", value: 62),
        Stat(name: "defense", value: 63),
        Stat(name: "special-attack", value: 80),
        Stat(name: "special-defense", value: 80),
        Stat(name: "speed", value: 60)
    ]),
  
  Pokemon(id: 3, name: "Venusaur",
    detailInfo: "Venusaur has a large flower on its back. The flower's color becomes more vivid if it absorbs enough nutrients and sunlight. The flower's fragrance soothes people who are feeling down.",
    type: [PokeType.grass, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.ice, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/003.png",
    stats: [
        Stat(name: "hp", value: 80),
        Stat(name: "attack", value: 82),
        Stat(name: "defense", value: 83),
        Stat(name: "special-attack", value: 100),
        Stat(name: "special-defense", value: 100),
        Stat(name: "speed", value: 80)
    ]),
  
  Pokemon(id: 4, name: "Charmander",
    detailInfo: "The flame on its tail shows its emotions. It waves gently when Charmander is happy, and burns fiercely when it is angry.",
    type: [PokeType.fire],
    weak: [PokeType.ground, PokeType.rock, PokeType.water],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png",
    stats: [
        Stat(name: "hp", value: 39),
        Stat(name: "attack", value: 52),
        Stat(name: "defense", value: 43),
        Stat(name: "special-attack", value: 60),
        Stat(name: "special-defense", value: 50),
        Stat(name: "speed", value: 65)
    ]),
  
  Pokemon(id: 5, name: "Charmeleon",
    detailInfo: "Charmeleon mercilessly tears its enemies apart with its sharp claws. If it encounters a strong opponent, it becomes aggressive. In that case, the flame on its tail burns with a whitish-blue color.",
    type: [PokeType.fire],
    weak: [PokeType.ground, PokeType.rock, PokeType.water],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/005.png",
    stats: [
        Stat(name: "hp", value: 58),
        Stat(name: "attack", value: 64),
        Stat(name: "defense", value: 58),
        Stat(name: "special-attack", value: 80),
        Stat(name: "special-defense", value: 65),
        Stat(name: "speed", value: 80)
    ]),
  
  Pokemon(id: 6, name: "Charizard",
    detailInfo: "Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never targets weaker foes.",
    type: [PokeType.fire, PokeType.flying],
    weak: [PokeType.ground, PokeType.electric, PokeType.water],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png",
    stats: [
        Stat(name: "hp", value: 78),
        Stat(name: "attack", value: 84),
        Stat(name: "defense", value: 78),
        Stat(name: "special-attack", value: 109),
        Stat(name: "special-defense", value: 85),
        Stat(name: "speed", value: 100)
    ]),
  
  Pokemon(id: 7, name: "Squirtle",
    detailInfo: "Squirtle's shell is not merely used for protection. Its rounded shape and the grooves on its surface help reduce water resistance, enabling it to swim at high speeds.",
    type: [PokeType.water],
    weak: [PokeType.electric, PokeType.grass],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png",
    stats: [
        Stat(name: "hp", value: 44),
        Stat(name: "attack", value: 48),
        Stat(name: "defense", value: 65),
        Stat(name: "special-attack", value: 50),
        Stat(name: "special-defense", value: 64),
        Stat(name: "speed", value: 43)
    ]),
  
  Pokemon(id: 8, name: "Wartortle",
    detailInfo: "Its fluffy tail darkens in color with age. The scars on its shell are evidence of its toughness.",
    type: [PokeType.water],
    weak: [PokeType.electric, PokeType.grass],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/008.png",
    stats: [
        Stat(name: "hp", value: 59),
        Stat(name: "attack", value: 63),
        Stat(name: "defense", value: 80),
        Stat(name: "special-attack", value: 65),
        Stat(name: "special-defense", value: 80),
        Stat(name: "speed", value: 58)
    ]),
  
  Pokemon(id: 9, name: "Blastoise",
    detailInfo: "Blastoise has water cannons that protrude from its shell. They can shoot water bullets with excellent accuracy, hitting empty cans from over 50 meters away.",
    type: [PokeType.water],
    weak: [PokeType.electric, PokeType.grass],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/009.png",
    stats: [
        Stat(name: "hp", value: 79),
        Stat(name: "attack", value: 83),
        Stat(name: "defense", value: 100),
        Stat(name: "special-attack", value: 85),
        Stat(name: "special-defense", value: 105),
        Stat(name: "speed", value: 78)
    ]),
  
  Pokemon(id: 10, name: "Caterpie",
    detailInfo: "It has a voracious appetite, capable of devouring leaves bigger than itself in an instant. Its antennae release a strong stench.",
    type: [PokeType.bug],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/010.png",
    stats: [
        Stat(name: "hp", value: 45),
        Stat(name: "attack", value: 30),
        Stat(name: "defense", value: 35),
        Stat(name: "special-attack", value: 20),
        Stat(name: "special-defense", value: 20),
        Stat(name: "speed", value: 45)
    ]),
  
  Pokemon(id: 11, name: "Metapod",
    detailInfo: "The shell covering its body is as hard as iron. It doesn't move much because it's preparing for evolution with its soft inner body.",
    type: [PokeType.bug],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/011.png",
    stats: [
        Stat(name: "hp", value: 50),
        Stat(name: "attack", value: 20),
        Stat(name: "defense", value: 55),
        Stat(name: "special-attack", value: 25),
        Stat(name: "special-defense", value: 25),
        Stat(name: "speed", value: 30)
    ]),
  
  Pokemon(id: 12, name: "Butterfree",
    detailInfo: "Butterfree has an excellent ability to find tasty flower nectar. It can locate blooming flowers even from 10 kilometers away and bring back the nectar.",
    type: [PokeType.bug, PokeType.flying],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock, PokeType.electric, PokeType.ice],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/012.png",
    stats: [
        Stat(name: "hp", value: 60),
        Stat(name: "attack", value: 45),
        Stat(name: "defense", value: 50),
        Stat(name: "special-attack", value: 90),
        Stat(name: "special-defense", value: 80),
        Stat(name: "speed", value: 70)
    ]),
  
  Pokemon(id: 13, name: "Weedle",
    detailInfo: "It has a very sensitive sense of smell. Using its large red nose, it can sniff out its favorite leaves even among unpleasant-smelling ones.",
    type: [PokeType.bug, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/013.png",
    stats: [
        Stat(name: "hp", value: 40),
        Stat(name: "attack", value: 35),
        Stat(name: "defense", value: 30),
        Stat(name: "special-attack", value: 20),
        Stat(name: "special-defense", value: 20),
        Stat(name: "speed", value: 50)
    ]),
  
  Pokemon(id: 14, name: "Kakuna",
    detailInfo: "It hangs from trees and hardly moves, busy preparing for evolution. Its body gradually heats up as evidence.",
    type: [PokeType.bug, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/014.png",
    stats: [
        Stat(name: "hp", value: 45),
        Stat(name: "attack", value: 25),
        Stat(name: "defense", value: 50),
        Stat(name: "special-attack", value: 25),
        Stat(name: "special-defense", value: 25),
        Stat(name: "speed", value: 35)
    ]),
  
  Pokemon(id: 15, name: "Beedrill",
    detailInfo: "Beedrill has a strong sense of territory. It won't let anyone approach its nest and will attack in swarms if angered.",
    type: [PokeType.bug, PokeType.poison],
    weak: [PokeType.fire, PokeType.flying, PokeType.rock, PokeType.psychic],
    pokeImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/015.png",
    stats: [
        Stat(name: "hp", value: 65),
        Stat(name: "attack", value: 90),
        Stat(name: "defense", value: 40),
        Stat(name: "special-attack", value: 45),
        Stat(name: "special-defense", value: 80),
        Stat(name: "speed", value: 75)
    ])
]
