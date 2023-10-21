//
//  OpenMM_NonbondedForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_NonbondedForce: OpenMM_Force {
  public override init() {
    super.init(_openmm_create(OpenMM_NonbondedForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_NonbondedForce_destroy(pointer)
  }
  
  @discardableResult
  public func addParticle(
    charge: Double, sigma: Double, epsilon: Double
  ) -> Int {
    let index = OpenMM_NonbondedForce_addParticle(
      pointer, charge, sigma, epsilon)
    return Int(index)
  }
  
  public func createExceptionsFromBonds(
    _ bonds: OpenMM_BondArray, coulomb14Scale: Double, lj14Scale: Double
  ) {
    OpenMM_NonbondedForce_createExceptionsFromBonds(
      pointer, bonds.pointer, coulomb14Scale, lj14Scale)
  }
}
