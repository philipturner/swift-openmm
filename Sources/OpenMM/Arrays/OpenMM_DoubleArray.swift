//
//  OpenMM_DoubleArray.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_DoubleArray: OpenMM_Array {
  public convenience init(size: Int) {
    self.init(_openmm_create(Int32(size), OpenMM_DoubleArray_create))
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_DoubleArray_destroy(pointer)
  }
  
  public func append(_ value: Double) {
    OpenMM_DoubleArray_append(pointer, value)
  }
  
  public override var size: Int {
    let _size = OpenMM_DoubleArray_getSize(pointer)
    return Int(_size)
  }
  
  public subscript(index: Int) -> Double {
    get {
      _openmm_index_get(pointer, index, OpenMM_DoubleArray_get)
    }
    set {
      OpenMM_DoubleArray_set(pointer, Int32(index), newValue)
    }
  }
}
