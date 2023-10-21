//
//  OpenMM_CustomCompoundBondForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_CustomCompoundBondForce: OpenMM_Force {
  public init(numParticles: Int, energy: String) {
    super.init(_openmm_create(
      Int32(numParticles), energy, OpenMM_CustomCompoundBondForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_CustomCompoundBondForce_destroy(pointer)
  }
  
  @discardableResult
  public func addBond(
    particles: OpenMM_IntArray, parameters: OpenMM_DoubleArray
  ) -> Int {
    let index = OpenMM_CustomCompoundBondForce_addBond(
      pointer, particles.pointer, parameters.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addGlobalParameter(
    name: String, defaultValue: Double
  ) -> Int {
    let index = OpenMM_CustomCompoundBondForce_addGlobalParameter(
      pointer, name, defaultValue)
    return Int(index)
  }
  
  @discardableResult
  public func addPerBondParameter(
    name: String
  ) -> Int {
    let index = OpenMM_CustomCompoundBondForce_addPerBondParameter(
      pointer, name)
    return Int(index)
  }
}
