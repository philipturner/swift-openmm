//
//  OpenMM_VerletIntegrator.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_VerletIntegrator: OpenMM_Integrator {
  public convenience init(stepSize: Double) {
    self.init(_openmm_create(stepSize, OpenMM_VerletIntegrator_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_VerletIntegrator_destroy(pointer)
  }
}
