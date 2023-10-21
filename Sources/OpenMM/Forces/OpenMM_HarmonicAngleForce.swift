//
//  OpenMM_HarmonicAngleForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_HarmonicAngleForce: OpenMM_Force {
  public override init() {
    super.init(_openmm_create(OpenMM_HarmonicAngleForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_HarmonicAngleForce_destroy(pointer)
  }
  
  @discardableResult
  public func addAngle(
    particles: SIMD3<Int>, angle: Double, k: Double
  ) -> Int {
    let index = OpenMM_HarmonicAngleForce_addAngle(
      pointer, Int32(particles[0]), Int32(particles[1]),
      Int32(particles[2]), angle, k)
    return Int(index)
  }
}
