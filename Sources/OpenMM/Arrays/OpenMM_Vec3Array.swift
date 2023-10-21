//
//  OpenMM_Vec3Array.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_Vec3Array: OpenMM_Array {
  public convenience init(size: Int) {
    self.init(_openmm_create(Int32(size), OpenMM_Vec3Array_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_Vec3Array_destroy(pointer)
  }
  
  public func append(_ vec: SIMD3<Double>) {
    let _vector = OpenMM_Vec3(x: vec.x, y: vec.y, z: vec.z)
    OpenMM_Vec3Array_append(pointer, _vector)
  }
  
  public override var size: Int {
    let _size = OpenMM_Vec3Array_getSize(pointer)
    return Int(_size)
  }
  
  public subscript(index: Int) -> SIMD3<Double> {
    get {
      let _element = _openmm_index_get(pointer, index, OpenMM_Vec3Array_get)
      
      // Cannot assume this is aligned to 4 x 8 bytes, so read each element
      // separately. If this part becomes a bottleneck in the CPU code, we know
      // how to fix it.
      let _vector: OpenMM_Vec3 = _element.pointee
      return SIMD3(_vector.x, _vector.y, _vector.z)
    }
    set {
      let _vector = OpenMM_Vec3(x: newValue.x, y: newValue.y, z: newValue.z)
      OpenMM_Vec3Array_set(pointer, Int32(index), _vector)
    }
  }
}
