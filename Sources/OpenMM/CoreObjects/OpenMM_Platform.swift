//
//  OpenMM_Platform.swift
//
//
//  Created by Philip Turner on 10/21/23.
//

import COpenMM

public class OpenMM_Platform: OpenMM_Object {
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_Platform_destroy(pointer)
  }
  
  public static var defaultPluginsDirectory: String? {
    let _directory = OpenMM_Platform_getDefaultPluginsDirectory()
    guard let _directory else {
      return nil
    }
    return String(cString: _directory)
  }
  
  @discardableResult
  public static func loadPlugins(directory: String) -> OpenMM_StringArray? {
    let _plugins = OpenMM_Platform_loadPluginsFromDirectory(directory)
    guard let _plugins else {
      return nil
    }
    let plugins = OpenMM_StringArray(_plugins)
    plugins.retain()
    return plugins
  }
  
  public static func loadPluginLibrary(file: String) {
    OpenMM_Platform_loadPluginLibrary(file)
  }
  
  public var name: String {
    .init(cString: _openmm_get(pointer, OpenMM_Platform_getName))
  }
}
