//
//  OpenMM_PropertyArray.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

@dynamicMemberLookup
public class OpenMM_PropertyArray: OpenMM_Array {
  public override var size: Int {
    let _size = OpenMM_PropertyArray_getSize(pointer)
    return Int(_size)
  }
  
  public subscript(dynamicMember name: String) -> String {
    get {
      String(cString: OpenMM_PropertyArray_get(pointer, name))
    }
  }
}
