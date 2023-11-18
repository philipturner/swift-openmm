//
//  OpenMM_LangevinMiddleIntegrator.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_LangevinMiddleIntegrator: OpenMM_Integrator {
  public convenience init(
    temperature: Double, frictionCoeff: Double, stepSize: Double
  ) {
    self.init(_openmm_create(
      temperature, frictionCoeff, stepSize,
      OpenMM_LangevinMiddleIntegrator_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_LangevinMiddleIntegrator_destroy(pointer)
  }
  
  public override func step(_ steps: Int) {
    OpenMM_LangevinMiddleIntegrator_step(pointer, Int32(steps))
  }
}
