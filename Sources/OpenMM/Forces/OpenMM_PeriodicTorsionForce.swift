//
//  OpenMM_PeriodicTorsionForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_PeriodicTorsionForce: OpenMM_Force {
  public override init() {
    super.init(_openmm_create(OpenMM_PeriodicTorsionForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_PeriodicTorsionForce_destroy(pointer)
  }
  
  @discardableResult
  public func addTorsion(
    particles: SIMD4<Int>, periodicity: Int, phase: Double, k: Double
  ) -> Int {
    let index = OpenMM_PeriodicTorsionForce_addTorsion(
      pointer, Int32(particles[0]), Int32(particles[1]), Int32(particles[2]),
      Int32(particles[3]), Int32(periodicity), phase, k)
    return Int(index)
  }
}
