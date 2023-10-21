//
//  OpenMM_CustomNonbondedForce.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_CustomNonbondedForce: OpenMM_Force {
  public init(energy: String) {
    super.init(_openmm_create(energy, OpenMM_CustomNonbondedForce_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_CustomNonbondedForce_destroy(pointer)
  }
  
  @discardableResult
  public func addGlobalParameter(
    name: String, defaultValue: Double
  ) -> Int {
    let index = OpenMM_CustomNonbondedForce_addGlobalParameter(
      pointer, name, defaultValue)
    return Int(index)
  }
  
  @discardableResult
  public func addInteractionGroup(
    set1: OpenMM_IntSet, set2: OpenMM_IntSet
  ) -> Int {
    let index = OpenMM_CustomNonbondedForce_addInteractionGroup(
      pointer, set1.pointer, set2.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addParticle(
    parameters: OpenMM_DoubleArray
  ) -> Int {
    let index = OpenMM_CustomNonbondedForce_addParticle(
      pointer, parameters.pointer)
    return Int(index)
  }
  
  @discardableResult
  public func addPerParticleParameter(
    name: String
  ) -> Int {
    let index = OpenMM_CustomNonbondedForce_addPerParticleParameter(
      pointer, name)
    return Int(index)
  }
  
  public func createExclusionsFromBonds(
    _ bonds: OpenMM_BondArray, bondCutoff: Int
  ) {
    OpenMM_CustomNonbondedForce_createExclusionsFromBonds(
      pointer, bonds.pointer, Int32(bondCutoff))
  }
  
  public var cutoffDistance: Double {
    get {
      _openmm_get(pointer, OpenMM_CustomNonbondedForce_getCutoffDistance)
    }
    set {
      OpenMM_CustomNonbondedForce_setCutoffDistance(pointer, newValue)
    }
  }
  
  public var nonbondedMethod: NonbondedMethod {
    get {
        let rawValue: UInt32 = UInt32(OpenMM_CustomNonbondedForce_getNonbondedMethod(pointer).rawValue)
        return NonbondedMethod(rawValue: rawValue)
    }
    set {
      let rawValue = OpenMM_CustomNonbondedForce_NonbondedMethod(
        rawValue: .init(newValue.rawValue))
      OpenMM_CustomNonbondedForce_setNonbondedMethod(pointer, rawValue)
    }
  }
  
  public var switchingDistance: Double {
    get {
      _openmm_get(pointer, OpenMM_CustomNonbondedForce_getSwitchingDistance)
    }
    set {
      OpenMM_CustomNonbondedForce_setSwitchingDistance(pointer, newValue)
    }
  }
  
  public var useSwitchingFunction: Bool {
    get {
      let rawValue = _openmm_get(pointer, OpenMM_CustomNonbondedForce_getUseSwitchingFunction)
      return rawValue == OpenMM_True
    }
    set {
      let rawValue = newValue ? OpenMM_True : OpenMM_False
      OpenMM_CustomNonbondedForce_setUseSwitchingFunction(pointer, rawValue)
    }
  }
}

extension OpenMM_CustomNonbondedForce {
  public struct NonbondedMethod: OptionSet {
    public var rawValue: UInt32
    
    @inlinable
    public init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
    
    init(_ _openmm_type: OpenMM_CustomNonbondedForce_NonbondedMethod) {
      self.init(rawValue: UInt32(_openmm_type.rawValue))
    }
    
    public static let noCutoff: NonbondedMethod =
      .init(OpenMM_CustomNonbondedForce_NoCutoff)
    public static let cutoffNonPeriodic: NonbondedMethod =
      .init(OpenMM_CustomNonbondedForce_CutoffNonPeriodic)
    public static let cutoffPeriodic: NonbondedMethod =
      .init(OpenMM_CustomNonbondedForce_CutoffPeriodic)
  }
}
