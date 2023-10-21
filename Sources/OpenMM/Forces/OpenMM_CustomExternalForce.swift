//
//  OpenMM_CustomExternalForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_CustomExternalForce: OpenMM_Force {
  public init(energy: String) {
    super.init(_openmm_create(energy, OpenMM_CustomExternalForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_CustomExternalForce_destroy(pointer)
  }
  
  @discardableResult
  public func addGlobalParameter(
    name: String, defaultValue: Double
  ) -> Int {
    let index = OpenMM_CustomExternalForce_addGlobalParameter(
      pointer, name, defaultValue)
    return Int(index)
  }
  
  @discardableResult
  public func addParticle(
    _ particle: Int, parameters: OpenMM_DoubleArray
  ) -> Int {
    let index = OpenMM_CustomExternalForce_addParticle(
      pointer, Int32(particle), parameters.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addPerParticleParameter(
    name: String
  ) -> Int {
    let index = OpenMM_CustomExternalForce_addPerParticleParameter(
      pointer, name)
    return Int(index)
  }
  
  /// There is no simple way to wrap this in a Swift computed property.
  public func setParticleParameters(
    index: Int, particle: Int, parameters: OpenMM_DoubleArray
  ) {
    OpenMM_CustomExternalForce_setParticleParameters(
      pointer, Int32(truncatingIfNeeded: index),
      Int32(truncatingIfNeeded: particle), parameters.pointer)
  }
  
  public func updateParametersInContext(_ context: OpenMM_Context) {
    OpenMM_CustomExternalForce_updateParametersInContext(
      pointer, context.pointer)
  }
}
