//
//  OpenMM_CompoundIntegrator.swift
//
//
//  Created by Philip Turner on 11/18/23.
//

import COpenMM

public class OpenMM_CompoundIntegrator: OpenMM_Integrator {
  public override convenience init() {
    self.init(OpenMM_CompoundIntegrator_create())
    self.retain()
  }
  
  public override var constraintTolerance: Double {
    get {
      _openmm_get(pointer, OpenMM_CompoundIntegrator_getConstraintTolerance)
    }
    set {
      OpenMM_CompoundIntegrator_setConstraintTolerance(pointer, newValue)
    }
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_CompoundIntegrator_destroy(pointer)
  }
  
  public override func step(_ steps: Int) {
    OpenMM_CompoundIntegrator_step(pointer, Int32(steps))
  }
  
  /// WARNING: This does not modify the step size of integrators not currently
  /// selected. You must set the step size every time you switch integrators.
  public override var stepSize: Double {
    get {
      _openmm_get(pointer, OpenMM_CompoundIntegrator_getStepSize)
    }
    set {
      OpenMM_CompoundIntegrator_setStepSize(pointer, newValue)
    }
  }
  
  @discardableResult
  public func addIntegrator(_ integrator: OpenMM_Integrator) -> Int {
    let index = OpenMM_CompoundIntegrator_addIntegrator(
      pointer, integrator.pointer)
    return Int(index)
  }
  
  public var currentIntegrator: Int {
    get {
      let index = OpenMM_CompoundIntegrator_getCurrentIntegrator(pointer)
      return Int(index)
    }
    set {
      OpenMM_CompoundIntegrator_setCurrentIntegrator(pointer, Int32(newValue))
    }
  }
}
