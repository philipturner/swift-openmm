//
//  OpenMM_IntArray.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_IntArray: OpenMM_Array {
  public convenience init(size: Int) {
    self.init(_openmm_create(Int32(size), OpenMM_IntArray_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_IntArray_destroy(pointer)
  }
  
  public func append(_ value: Int) {
    OpenMM_IntArray_append(pointer, Int32(value))
  }
  
  public override var size: Int {
    let _size = OpenMM_IntArray_getSize(pointer)
    return Int(_size)
  }
  
  public subscript(index: Int) -> Int {
    get {
      Int(_openmm_index_get(pointer, index, OpenMM_IntArray_get))
    }
    set {
      OpenMM_IntArray_set(pointer, Int32(index), Int32(newValue))
    }
  }
}
