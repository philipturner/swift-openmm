//
//  OpenMM_XmlSerializer.swift
//
//
//  Created by Philip Turner on 2/22/24.
//

import COpenMM

// Not adding the deserialization functions here. They caused some strange
// issues with the Swift compiler and overriding the by-pointer initializer
// of 'OpenMM_Object'.

public class OpenMM_XmlSerializer {
  public static func serializeSystem(_ system: OpenMM_System) -> String {
    let cString = OpenMM_XmlSerializer_serializeSystem(system.pointer)
    guard let cString else {
      fatalError("C string was null.")
    }
    let output = String(cString: cString)
    cString.deallocate()
    return output
  }
  
  public static func serializeState(_ state: OpenMM_State) -> String {
    let cString = OpenMM_XmlSerializer_serializeState(state.pointer)
    guard let cString else {
      fatalError("C string was null.")
    }
    let output = String(cString: cString)
    cString.deallocate()
    return output
  }
  
  public static func serializeIntegrator(
    _ integrator: OpenMM_Integrator
  ) -> String {
    let cString = OpenMM_XmlSerializer_serializeIntegrator(integrator.pointer)
    guard let cString else {
      fatalError("C string was null.")
    }
    let output = String(cString: cString)
    cString.deallocate()
    return output
  }
}
