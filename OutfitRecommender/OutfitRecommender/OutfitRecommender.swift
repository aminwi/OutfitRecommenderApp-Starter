//
//  OutfitRecommender.swift
//  OutfitRecommender
//
//  Created by Adrian Wisaksana on 5/26/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation

/**
 * An enum that declares all the possible types of events.
 */
enum EventType: String {
    
    case Sports = "Sports"
    case Formal = "Formal"
    case Casual = "Casual"
    
}

class OutfitRecommender {
    
    /**
     * A property that stores the event type of the outfit recommender.
     * This property will be used to determine which outfits to recommend.
     */
    var eventType: EventType
    
    // NOTE: `[:]` is one way to declare an empty dictionary in Swift
    
    /**
     * A dictionary that stores key-value pairs of `EventType` to an array of tops.
     */
    var tops: [EventType: [String]] = [:]
    
    /**
     * A dictionary that stores key-value pairs of `EventType` to an array of bottoms.
     */
    var bottoms: [EventType: [String]] = [:]
    
    init(eventType: EventType) {
        
        self.eventType = eventType
        
        // define tops
        tops[.Sports] = ["Tank Top", "Jersey"]
        tops[.Formal] = ["Vest", "Blouse"]
        tops[.Casual] = ["T-Shirt", "Long Sleeve Shirt"]
        
        // define bottoms
        bottoms[.Sports] = ["Soccer Shorts", "Tennis Skirt"]
        bottoms[.Formal] = ["Long Pants", "Pencil Skirt"]
        bottoms[.Casual] = ["Jeans", "Mini Skirt"]
        
    }
    
    /**
     * Returns the possible tops based on the outfit recommender's event type.
     *
     * - returns: An array of tops as Strings
     */
    func getPossibleTops() -> [String] {
        
        guard let tops = tops[eventType] else { return [] }
        
        return tops
        
    }
    
    /**
     * Returns the possible bottoms based on the outfit recommender's event type.
     *
     * - returns: An array of bottoms as Strings
     */
    func getPossibleBottoms() -> [String] {
        
        guard let bottoms = bottoms[eventType] else { return [] }
        
        return bottoms
        
    }
    
    /**
     * Creates a random integer between 0 and the given `max` value.
     *
     * - returns: A random integer between 0 and the given `max` value.
     */
    func randomNumberFromZeroTo(max: Int) -> Int {
        
        // `arc4random_uniform` is a function imported from the Foundation library
        // We utilise it to generate our random number.
        let randomIndex = Int(arc4random_uniform(UInt32(max)))
        
        return randomIndex
        
    }
    
    /**
     * Finds a tuple of a possible top and bottom based on the outfit
     * recommender's event type.
     *
     * - returns: A tuple of Top and Bottom
     */
    func findPossibleOutfit() -> (top: String, bottom: String) {
        
        // possible top
        guard let allTopsForEventType = tops[eventType] else { return ("", "") }
        let randomIndexForTops = randomNumberFromZeroTo(allTopsForEventType.count)
        let possibleTop = allTopsForEventType[randomIndexForTops]
        
        // possible bottom
        guard let allBottomsForEventType = bottoms[eventType] else { return ("", "") }
        let randomIndexForBottoms = randomNumberFromZeroTo(allBottomsForEventType.count)
        let possibleBottom = allBottomsForEventType[randomIndexForBottoms]
        
        return (possibleTop, possibleBottom)
        
    }
    
}