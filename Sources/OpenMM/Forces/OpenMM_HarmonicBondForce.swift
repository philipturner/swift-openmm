//
//  OpenMM_HarmonicBondForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_HarmonicBondForce: OpenMM_Force {
  public override init() {
    super.init(_openmm_create(OpenMM_HarmonicBondForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_HarmonicBondForce_destroy(pointer)
  }
  
  @discardableResult
  public func addBond(
    particles: SIMD2<Int>, length: Double, k: Double
  ) -> Int {
    let index = OpenMM_HarmonicBondForce_addBond(
      pointer, Int32(particles[0]), Int32(particles[1]), length, k)
    return Int(index)
  }
}
