//
//  OpenMM_Integrator.swift
//
//
//  Created by Philip Turner on 6/25/23.
//

import COpenMM

public class OpenMM_Integrator: OpenMM_Object {
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_Integrator_destroy(pointer)
  }
  
  public var constraintTolerance: Double {
    get {
      _openmm_get(pointer, OpenMM_Integrator_getConstraintTolerance)
    }
    set {
      OpenMM_Integrator_setConstraintTolerance(pointer, newValue)
    }
  }
  
  public func step(_ steps: Int) {
    OpenMM_Integrator_step(pointer, Int32(steps))
  }
  
  /// WARNING: Never call the getter. There is no corresponding OpenMM function.
  public var stepSize: Double {
    get {
      fatalError("'OpenMM_Integrator.stepSize' has no getter.")
    }
    set {
      OpenMM_Integrator_setStepSize(pointer, newValue)
    }
  }
}
