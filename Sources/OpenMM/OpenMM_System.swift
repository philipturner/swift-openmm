//
//  OpenMM_System.swift
//  MolecularRendererApp
//
//  Created by Philip Turner on 6/25/23.
//

import COpenMM

public class OpenMM_State: OpenMM_Object {
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
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_State_destroy(pointer)
  }
  
  public var kineticEnergy: Double {
    _openmm_get(pointer, OpenMM_State_getKineticEnergy)
  }
  
  public var positions: OpenMM_Vec3Array {
    .init(_openmm_get(pointer, OpenMM_State_getPositions))
  }
  
  public var potentialEnergy: Double {
    _openmm_get(pointer, OpenMM_State_getPotentialEnergy)
  }
  
  public var time: Double {
    _openmm_get(pointer, OpenMM_State_getTime)
  }
  
  public var velocities: OpenMM_Vec3Array {
    .init(_openmm_get(pointer, OpenMM_State_getVelocities))
  }
}

public class OpenMM_System: OpenMM_Object {
  public override init() {
    super.init(_openmm_create(OpenMM_System_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_System_destroy(pointer)
  }
  
  @discardableResult
  public func addConstraint(
    particles: SIMD2<Int>, distance: Double
  ) -> Int {
    let index = OpenMM_System_addConstraint(
      pointer, Int32(particles[0]), Int32(particles[1]), distance)
    return Int(index)
  }
  
  /// Transfer ownership of the `OpenMM_Force` to OpenMM before calling this.
  @discardableResult
  public func addForce(_ force: OpenMM_Force) -> Int {
    let index = OpenMM_System_addForce(pointer, force.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addParticle(mass: Double) -> Int {
    let index = OpenMM_System_addParticle(pointer, mass)
    return Int(index)
  }
  
  /// There is no simple way to wrap this in a Swift computed property.
  public func getParticleMass(index: Int) -> Double {
    return OpenMM_System_getParticleMass(pointer, Int32(index))
  }
  
  /// There is no simple way to wrap this in a Swift computed property.
  public func setParticleMass(_ mass: Double, index: Int) {
    OpenMM_System_setParticleMass(pointer, Int32(index), mass)
  }
}
