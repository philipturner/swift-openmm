//
//  OpenMM_ParameterArray.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

@dynamicMemberLookup
public class OpenMM_ParameterArray: OpenMM_Array {
  public override var size: Int {
    let _size = OpenMM_ParameterArray_getSize(pointer)
    return Int(_size)
  }
  
  public subscript(dynamicMember name: String) -> Double {
    get {
      OpenMM_ParameterArray_get(pointer, name)
    }
  }
}
