//
//  SeriesGuardadas+CoreDataProperties.swift
//  Mi Cartelera
//
//  Created by Erinson Andres Romero Terry on 16/12/22.
//
//

import Foundation
import CoreData


extension SeriesGuardadas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SeriesGuardadas> {
        return NSFetchRequest<SeriesGuardadas>(entityName: "SeriesGuardadas")
    }

    @NSManaged public var idSerie: String?
    @NSManaged public var imagenUrl: String?
    @NSManaged public var nombreSerie: String?
    @NSManaged public var overViewSerie: String?
    @NSManaged public var voteSerie: Float

}

extension SeriesGuardadas : Identifiable {

}
