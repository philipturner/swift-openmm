//
//  OpenMM_CustomHbondForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_CustomHbondForce: OpenMM_Force {
  public init(energy: String) {
    super.init(_openmm_create(energy, OpenMM_CustomHbondForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_CustomHbondForce_destroy(pointer)
  }
  
  @discardableResult
  public func addAcceptor(
    particles: SIMD2<Int>, parameters: OpenMM_DoubleArray
  ) -> Int {
    let index = OpenMM_CustomHbondForce_addAcceptor(
      pointer, Int32(particles[0]), Int32(particles[1]), Int32(particles[2]),
      parameters.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addDonor(
    particles: SIMD2<Int>, parameters: OpenMM_DoubleArray
  ) -> Int {
    let index = OpenMM_CustomHbondForce_addDonor(
      pointer, Int32(particles[0]), Int32(particles[1]), Int32(particles[2]),
      parameters.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addExclusion(
    donor: Int, acceptor: Int
  ) -> Int {
    let index = OpenMM_CustomHbondForce_addExclusion(
      pointer, Int32(donor), Int32(acceptor))
    return Int(index)
  }
  
  @discardableResult
  public func addGlobalParameter(
    name: String, defaultValue: Double
  ) -> Int {
    let index = OpenMM_CustomHbondForce_addGlobalParameter(
      pointer, name, defaultValue)
    return Int(index)
  }
  
  @discardableResult
  public func addPerAcceptorParameter(
    name: String
  ) -> Int {
    let index = OpenMM_CustomHbondForce_addPerAcceptorParameter(
      pointer, name)
    return Int(index)
  }
  
  @discardableResult
  public func addPerDonorParameter(
    name: String
  ) -> Int {
    let index = OpenMM_CustomHbondForce_addPerDonorParameter(
      pointer, name)
    return Int(index)
  }
  
  public var cutoffDistance: Double {
    get {
      _openmm_get(pointer, OpenMM_CustomHbondForce_getCutoffDistance)
    }
    set {
      OpenMM_CustomHbondForce_setCutoffDistance(pointer, newValue)
    }
  }
  
  public var nonbondedMethod: NonbondedMethod {
    get {
        let rawValue: UInt32 = UInt32(OpenMM_CustomHbondForce_getNonbondedMethod(pointer).rawValue)
        return NonbondedMethod(rawValue: rawValue)
    }
    set {
      let rawValue = OpenMM_CustomHbondForce_NonbondedMethod(
        rawValue: .init(newValue.rawValue))
      OpenMM_CustomHbondForce_setNonbondedMethod(pointer, rawValue)
    }
  }
}

extension OpenMM_CustomHbondForce {
  public struct NonbondedMethod: OptionSet {
    public var rawValue: UInt32
    
    @inlinable
    public init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
    
    init(_ _openmm_type: OpenMM_CustomHbondForce_NonbondedMethod) {
      self.init(rawValue: UInt32(_openmm_type.rawValue))
    }
    
    public static let noCutoff: NonbondedMethod =
      .init(OpenMM_CustomHbondForce_NoCutoff)
    public static let cutoffNonPeriodic: NonbondedMethod =
      .init(OpenMM_CustomHbondForce_CutoffNonPeriodic)
    public static let cutoffPeriodic: NonbondedMethod =
      .init(OpenMM_CustomHbondForce_CutoffPeriodic)
  }
}
