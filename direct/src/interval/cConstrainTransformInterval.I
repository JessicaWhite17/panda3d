// Filename: cConstrainTransformInterval.I
// Created by:  pratt (29Sep06)
//
////////////////////////////////////////////////////////////////////
//
// PANDA 3D SOFTWARE
// Copyright (c) Carnegie Mellon University.  All rights reserved.
//
// All use of this software is subject to the terms of the revised BSD
// license.  You should have received a copy of this license along
// with this source code in a file named "LICENSE."
//
////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////
//     Function: CConstrainTransformInterval::get_node
//       Access: Published
//  Description: Returns the "source" node.
////////////////////////////////////////////////////////////////////
INLINE const NodePath &CConstrainTransformInterval::
get_node() const {
  return _node;
}

////////////////////////////////////////////////////////////////////
//     Function: CConstrainTransformInterval::get_target
//       Access: Published
//  Description: Returns the "target" node.
////////////////////////////////////////////////////////////////////
INLINE const NodePath &CConstrainTransformInterval::
get_target() const {
  return _target;
}
