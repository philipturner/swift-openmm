//
//  OpenMM_CustomAngleForce.swift
//  
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_CustomAngleForce: OpenMM_Force {
  public init(energy: String) {
    super.init(_openmm_create(energy, OpenMM_CustomAngleForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_CustomAngleForce_destroy(pointer)
  }
  
  @discardableResult
  public func addAngle(
    particles: SIMD3<Int>, parameters: OpenMM_DoubleArray
  ) -> Int {
    let index = OpenMM_CustomAngleForce_addAngle(
      pointer, Int32(particles[0]), Int32(particles[1]),
      Int32(particles[2]), parameters.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addGlobalParameter(
    name: String, defaultValue: Double
  ) -> Int {
    let index = OpenMM_CustomAngleForce_addGlobalParameter(
      pointer, name, defaultValue)
    return Int(index)
  }
  
  @discardableResult
  public func addPerAngleParameter(
    name: String
  ) -> Int {
    let index = OpenMM_CustomAngleForce_addPerAngleParameter(
      pointer, name)
    return Int(index)
  }
}
