//
//  OpenMM_GBSAOBCForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_GBSAOBCForce: OpenMM_Force {
  public override init() {
    super.init(_openmm_create(OpenMM_GBSAOBCForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_GBSAOBCForce_destroy(pointer)
  }
  
  @discardableResult
  public func addParticle(
    charge: Double, radius: Double, scalingFactor: Double
  ) -> Int {
    let index = OpenMM_GBSAOBCForce_addParticle(
      pointer, charge, radius, scalingFactor)
    return Int(index)
  }
  
  public var soluteDielectric: Double {
    get {
      _openmm_get(pointer, OpenMM_GBSAOBCForce_getSoluteDielectric)
    }
    set {
      OpenMM_GBSAOBCForce_setSoluteDielectric(pointer, newValue)
    }
  }
  
  public var solventDielectric: Double {
    get {
      _openmm_get(pointer, OpenMM_GBSAOBCForce_getSolventDielectric)
    }
    set {
      OpenMM_GBSAOBCForce_setSolventDielectric(pointer, newValue)
    }
  }
}
