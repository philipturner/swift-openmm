//
//  OpenMM_StringArray.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_StringArray: OpenMM_Array {
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_StringArray_destroy(pointer)
  }
  
  public override var size: Int {
    let _size = OpenMM_StringArray_getSize(pointer)
    return Int(_size)
  }
  
  public subscript(index: Int) -> String {
    get {
      .init(cString: _openmm_index_get(pointer, index, OpenMM_StringArray_get))
    }
    // `set` not supported yet.
  }
}
