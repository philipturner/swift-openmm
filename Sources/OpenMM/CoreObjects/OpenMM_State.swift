//
//  OpenMM_State.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_State: OpenMM_Object {
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_State_destroy(pointer)
  }
  
  public var dataTypes: OpenMM_State.DataType {
    let rawValue = OpenMM_State_getDataTypes(pointer)
    return .init(rawValue: UInt32(truncatingIfNeeded: rawValue))
  }
  
  public var energyParameterDerivatives: OpenMM_ParameterArray {
    .init(_openmm_get(pointer, OpenMM_State_getEnergyParameterDerivatives))
  }
  
  public var forces: OpenMM_Vec3Array {
    .init(_openmm_get(pointer, OpenMM_State_getForces))
  }
  
  public var kineticEnergy: Double {
    _openmm_get(pointer, OpenMM_State_getKineticEnergy)
  }
  
  public var parameters: OpenMM_ParameterArray {
    .init(_openmm_get(pointer, OpenMM_State_getParameters))
  }
  
  public var periodicBoxVectors: (
    a: SIMD3<Double>, b: SIMD3<Double>, c: SIMD3<Double>
  ) {
    var a = OpenMM_Vec3()
    var b = OpenMM_Vec3()
    var c = OpenMM_Vec3()
    OpenMM_State_getPeriodicBoxVectors(pointer, &a, &b, &c)
    
    return (
      SIMD3(a.x, a.y, a.z),
      SIMD3(b.x, b.y, b.z),
      SIMD3(c.x, c.y, c.z)
    )
  }
  
  public var periodicBoxVolume: Double {
    OpenMM_State_getPeriodicBoxVolume(pointer)
  }
  
  public var positions: OpenMM_Vec3Array {
    .init(_openmm_get(pointer, OpenMM_State_getPositions))
  }
  
  public var potentialEnergy: Double {
    _openmm_get(pointer, OpenMM_State_getPotentialEnergy)
  }
  
  public var stepCount: Int {
    let stepCount = OpenMM_State_getStepCount(pointer)
    return Int(truncatingIfNeeded: stepCount)
  }
  
  public var time: Double {
    _openmm_get(pointer, OpenMM_State_getTime)
  }
  
  public var velocities: OpenMM_Vec3Array {
    .init(_openmm_get(pointer, OpenMM_State_getVelocities))
  }
}

extension OpenMM_State {
  public struct DataType: OptionSet {
    public var rawValue: UInt32
    
    @inlinable
    public init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
    
    init(_ _openmm_type: OpenMM_State_DataType) {
      self.init(rawValue: UInt32(_openmm_type.rawValue))
    }
    
    public static let energy: DataType = .init(OpenMM_State_Energy)
    public static let forces: DataType = .init(OpenMM_State_Forces)
    public static let integratorParameters: DataType = .init(
      OpenMM_State_IntegratorParameters)
    public static let parameters: DataType = .init(OpenMM_State_Parameters)
    public static let parameterDerivatives: DataType = .init(
      OpenMM_State_ParameterDerivatives)
    public static let positions: DataType = .init(OpenMM_State_Positions)
    public static let velocities: DataType = .init(OpenMM_State_Velocities)
  }
}
