//
//  OpenMM_TwoParticleAverageSite.swift
//
//
//  Created by Philip Turner on 11/17/23.
//

import COpenMM

/// The function for fetching the weights in a particular virtual site has not
/// yet been implemented.
public class OpenMM_TwoParticleAverageSite: OpenMM_VirtualSite {
  public init(particles: SIMD2<Int>, weights: SIMD2<Double>) {
    super.init(OpenMM_TwoParticleAverageSite_create(
      Int32(particles[0]), Int32(particles[1]), weights[0], weights[1]))
  }
  
  public override class func destroy(_ pointer: OpaquePointer) {
    OpenMM_TwoParticleAverageSite_destroy(pointer)
  }
}
