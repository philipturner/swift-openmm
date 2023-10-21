//
//  OpenMM_BondArray.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_BondArray: OpenMM_Array {
  public convenience init(size: Int) {
    self.init(_openmm_create(Int32(size), OpenMM_BondArray_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_BondArray_destroy(pointer)
  }
  
  public func append(_ particles: SIMD2<Int>) {
    OpenMM_BondArray_append(pointer, Int32(particles[0]), Int32(particles[1]))
  }
  
  public override var size: Int {
    let _size = OpenMM_BondArray_getSize(pointer)
    return Int(_size)
  }
  
  public subscript(index: Int) -> SIMD2<Int> {
    get {
      var particle1: Int32 = -1
      var particle2: Int32 = -1
      OpenMM_BondArray_get(pointer, Int32(index), &particle1, &particle2)
      precondition(particle1 > -1 && particle2 > -1, "Invalid indices.")
      
      return SIMD2(Int(particle1), Int(particle2))
    }
    set {
      let particle1 = Int32(newValue[0])
      let particle2 = Int32(newValue[1])
      OpenMM_BondArray_set(pointer, Int32(index), particle1, particle2)
    }
  }
}
