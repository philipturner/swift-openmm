//
//  OpenMM_NoseHooverIntegrator.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_NoseHooverIntegrator: OpenMM_Integrator {
  public convenience init(stepSize: Double) {
    let pointer = OpenMM_NoseHooverIntegrator_create(stepSize)
    self.init(pointer)
    self.retain()
  }
  
  public convenience init(
    temperature: Double, collisionFrequency: Double, stepSize: Double,
    chainLength: Int = 3, numMTS: Int = 3, numYoshidaSuzuki: Int = 7
  ) {
    let pointer = OpenMM_NoseHooverIntegrator_create_2(
      temperature, collisionFrequency, stepSize,
      Int32(chainLength), Int32(numMTS), Int32(numYoshidaSuzuki))
    self.init(pointer)
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_NoseHooverIntegrator_destroy(pointer)
  }
  
  public override func step(_ steps: Int) {
    OpenMM_NoseHooverIntegrator_step(pointer, Int32(steps))
  }
}
