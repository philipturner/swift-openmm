//
//  OpenMM_Force.swift
//
//
//  Created by Philip Turner on 6/25/23.
//

import COpenMM

public class OpenMM_Force: OpenMM_Object {
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_Force_destroy(pointer)
  }
  
  public var forceGroup: Int {
    get {
      Int(_openmm_get(pointer, OpenMM_Force_getForceGroup))
    }
    set {
      OpenMM_Force_setForceGroup(pointer, Int32(newValue))
    }
  }
}
