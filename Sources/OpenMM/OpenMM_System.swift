//
//  OpenMM_System.swift
//
//
//  Created by Philip Turner on 6/25/23.
//

import COpenMM

public class OpenMM_System: OpenMM_Object {
  public override init() {
    super.init(_openmm_create(OpenMM_System_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_System_destroy(pointer)
  }
  
  @discardableResult
  public func addConstraint(
    particles: SIMD2<Int>, distance: Double
  ) -> Int {
    let index = OpenMM_System_addConstraint(
      pointer, Int32(particles[0]), Int32(particles[1]), distance)
    return Int(index)
  }
  
  /// Transfer ownership of the `OpenMM_Force` to OpenMM before calling this.
  @discardableResult
  public func addForce(_ force: OpenMM_Force) -> Int {
    let index = OpenMM_System_addForce(pointer, force.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addParticle(mass: Double) -> Int {
    let index = OpenMM_System_addParticle(pointer, mass)
    return Int(index)
  }
  
  /// There is no simple way to wrap this in a Swift computed property.
  public func getParticleMass(index: Int) -> Double {
    return OpenMM_System_getParticleMass(pointer, Int32(index))
  }
  
  /// There is no simple way to wrap this in a Swift computed property.
  public func setParticleMass(_ mass: Double, index: Int) {
    OpenMM_System_setParticleMass(pointer, Int32(index), mass)
  }
}
