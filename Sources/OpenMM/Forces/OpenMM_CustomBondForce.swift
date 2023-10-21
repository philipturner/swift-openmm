//
//  OpenMM_CustomBondForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_CustomBondForce: OpenMM_Force {
  public init(energy: String) {
    super.init(_openmm_create(energy, OpenMM_CustomBondForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_CustomBondForce_destroy(pointer)
  }
  
  @discardableResult
  public func addBond(
    particles: SIMD2<Int>, parameters: OpenMM_DoubleArray
  ) -> Int {
    let index = OpenMM_CustomBondForce_addBond(
      pointer, Int32(particles[0]), Int32(particles[1]), parameters.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addGlobalParameter(
    name: String, defaultValue: Double
  ) -> Int {
    let index = OpenMM_CustomBondForce_addGlobalParameter(
      pointer, name, defaultValue)
    return Int(index)
  }
  
  @discardableResult
  public func addPerBondParameter(
    name: String
  ) -> Int {
    let index = OpenMM_CustomBondForce_addPerBondParameter(
      pointer, name)
    return Int(index)
  }
}
