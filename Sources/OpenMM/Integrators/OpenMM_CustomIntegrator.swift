//
//  OpenMM_CustomIntegrator.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_CustomIntegrator: OpenMM_Integrator {
  public convenience init(stepSize: Double) {
    self.init(_openmm_create(stepSize, OpenMM_CustomIntegrator_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_CustomIntegrator_destroy(pointer)
  }
  
  public override func step(_ steps: Int) {
    OpenMM_CustomIntegrator_step(pointer, Int32(steps))
  }
  
  @discardableResult
  public func addComputeGlobal(
    variable: String, expression: String
  ) -> Int {
    let index = OpenMM_CustomIntegrator_addComputeGlobal(
      pointer, variable, expression)
    return Int(index)
  }
  
  @discardableResult
  public func addComputePerDof(
    variable: String, expression: String
  ) -> Int {
    let index = OpenMM_CustomIntegrator_addComputePerDof(
      pointer, variable, expression)
    return Int(index)
  }
  
  @discardableResult
  public func addConstrainPositions() -> Int {
    let index = OpenMM_CustomIntegrator_addConstrainPositions(pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addConstrainVelocities() -> Int {
    let index = OpenMM_CustomIntegrator_addConstrainVelocities(pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addGlobalVariable(
    name: String, initialValue: Double
  ) -> Int {
    let index = OpenMM_CustomIntegrator_addGlobalVariable(
      pointer, name, initialValue)
    return Int(index)
  }
  
  @discardableResult
  public func addPerDofVariable(
    name: String, initialValue: Double
  ) -> Int {
    let index = OpenMM_CustomIntegrator_addPerDofVariable(
      pointer, name, initialValue)
    return Int(index)
  }
  
  @discardableResult
  public func addUpdateContextState() -> Int {
    let index = OpenMM_CustomIntegrator_addUpdateContextState(pointer)
    return Int(index)
  }
  
  @discardableResult
  public func beginIfBlock(condition: String) -> Int {
    let index = OpenMM_CustomIntegrator_beginIfBlock(pointer, condition)
    return Int(index)
  }
  
  public func endBlock() {
    OpenMM_CustomIntegrator_endBlock(pointer)
  }
}
