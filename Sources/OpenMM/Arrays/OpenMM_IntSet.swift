//
//  OpenMM_IntSet.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_IntSet: OpenMM_Array {
  public override convenience init() {
    self.init(OpenMM_IntSet_create())
    self.retain()
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_IntSet_destroy(pointer)
  }
  
  public override var size: Int {
    let _size = OpenMM_IntSet_getSize(pointer)
    return Int(_size)
  }
  
  public func insert(_ value: Int) {
    OpenMM_IntSet_insert(pointer, Int32(value))
  }
}
