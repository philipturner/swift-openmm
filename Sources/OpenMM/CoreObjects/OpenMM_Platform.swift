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
  
  public static var platforms: [OpenMM_Platform] {
    let numPlatforms = Int(OpenMM_Platform_getNumPlatforms())
    var platforms: [OpenMM_Platform] = []
    for i in 0..<numPlatforms {
      guard let platform = OpenMM_Platform_getPlatform(Int32(i)) else {
        fatalError("Could not retrieve platform at index \(i).")
      }
      platforms.append(OpenMM_Platform(platform))
    }
    return platforms
  }
  
  public var name: String {
    String(cString: _openmm_get(pointer, OpenMM_Platform_getName))
  }
  
  public var propertyNames: OpenMM_StringArray {
    OpenMM_StringArray(_openmm_get(
      pointer, OpenMM_Platform_getPropertyNames))
  }
  
  public func getPropertyDefaultValue(_ property: String) -> String {
    let cString = OpenMM_Platform_getPropertyDefaultValue(pointer, property)
    guard let cString else {
      fatalError("Could not retrieve value for name '\(property)'.")
    }
    return String(cString: cString)
  }
  
  public func setPropertyDefaultValue(_ property: String, value: String) {
    OpenMM_Platform_setPropertyDefaultValue(pointer, property, value)
  }
}
