//
//  OpenMM_BrownianIntegrator.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_BrownianIntegrator: OpenMM_Integrator {
  public convenience init(
    temperature: Double, frictionCoeff: Double, stepSize: Double
  ) {
    self.init(_openmm_create(
      temperature, frictionCoeff, stepSize,
      OpenMM_BrownianIntegrator_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_BrownianIntegrator_destroy(pointer)
  }
  
  public override func step(_ steps: Int) {
    OpenMM_BrownianIntegrator_step(pointer, Int32(steps))
  }
}
