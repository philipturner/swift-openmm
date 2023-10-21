//
//  OpenMM_Context.swift
//
//
//  Created by Philip Turner on 6/25/23.
//

import COpenMM

public class OpenMM_Context: OpenMM_Object {
  public convenience init(
    system: OpenMM_System, integrator: OpenMM_Integrator
  ) {
    self.init(_openmm_create(
      system.pointer, integrator.pointer, OpenMM_Context_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_Context_destroy(pointer)
  }
  
  public var platform: OpenMM_Platform {
    .init(_openmm_get(pointer, OpenMM_Context_getPlatform))
  }
  
  /// WARNING: Never call the getter. There is no corresponding OpenMM function.
  public var positions: OpenMM_Vec3Array {
     get {
      _openmm_no_getter()
    }
    set {
      OpenMM_Context_setPositions(pointer, newValue.pointer)
    }
  }
  
  public func setVelocitiesToTemperature(
    _ temperature: Double,
    randomSeed: Int = .random(in: 0...Int.max)
  ) {
    OpenMM_Context_setVelocitiesToTemperature(
      pointer, temperature, Int32(randomSeed % (Int(Int32.max) + 1)))
  }
  
  public func state(
    types: OpenMM_State.DataType,
    enforcePeriodicBox: Bool = false,
    groups: Int? = nil
  ) -> OpenMM_State {
    var _state: OpaquePointer
    if let groups {
      _state = _openmm_get(
        pointer, Int32(truncatingIfNeeded: types.rawValue),
        enforcePeriodicBox ? 1 : 0, Int32(groups), OpenMM_Context_getState_2)
    } else {
      _state = _openmm_get(
        pointer, Int32(truncatingIfNeeded: types.rawValue),
        enforcePeriodicBox ? 1 : 0, OpenMM_Context_getState)
    }
    
    let state = OpenMM_State(_state)
    state.retain()
    return state
  }
  
  /// WARNING: Never call the getter. There is no corresponding OpenMM function.
  public var state: OpenMM_State {
    get {
      _openmm_no_getter()
    }
    set {
      OpenMM_Context_setState(pointer, newValue.pointer)
    }
  }
  
  public var stepCount: Int {
    get {
      let stepCount = _openmm_get(pointer, OpenMM_Context_getStepCount)
      return Int(truncatingIfNeeded: stepCount)
    }
    set {
      let stepCount = Int64(truncatingIfNeeded: newValue)
      OpenMM_Context_setStepCount(pointer, stepCount)
    }
  }
  
  public var time: Double {
    get {
      _openmm_get(pointer, OpenMM_Context_getTime)
    }
    set {
      OpenMM_Context_setTime(pointer, newValue)
    }
  }
  
  /// WARNING: Never call the getter. There is no corresponding OpenMM function.
  public var velocities: OpenMM_Vec3Array {
     get {
      _openmm_no_getter()
    }
    set {
      OpenMM_Context_setVelocities(pointer, newValue.pointer)
    }
  }
}
