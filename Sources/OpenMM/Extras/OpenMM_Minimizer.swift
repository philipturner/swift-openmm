//
//  OpenMM_Minimizer.swift
//
//
//  Created by Philip Turner on 10/14/23.
//

import COpenMM

/// This is not a subclass of `OpenMM_Object` for now, as it inherits no
/// instance members from `OpenMM_Object`.
public class OpenMM_LocalEnergyMinimizer {
  public static func minimize(
    context: OpenMM_Context,
    tolerance: Double = 10,
    maxIterations: Int = 0
  ) {
    OpenMM_LocalEnergyMinimizer_minimize(
      context.pointer, tolerance, Int32(maxIterations))
  }
}
