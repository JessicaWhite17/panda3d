// Filename: orthographicLens.I
// Created by:  mike (18Feb99)
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
//     Function: OrthographicLens::Constructor
//       Access: Public
//  Description:
////////////////////////////////////////////////////////////////////
INLINE OrthographicLens::
OrthographicLens() {
}

////////////////////////////////////////////////////////////////////
//     Function: OrthographicLens::Copy Constructor
//       Access: Public
//  Description:
////////////////////////////////////////////////////////////////////
INLINE OrthographicLens::
OrthographicLens(const OrthographicLens &copy) : Lens(copy) {
}

////////////////////////////////////////////////////////////////////
//     Function: OrthographicLens::Copy Assignment Operator
//       Access: Public
//  Description:
////////////////////////////////////////////////////////////////////
INLINE void OrthographicLens::
operator = (const OrthographicLens &copy) {
  Lens::operator = (copy);
}

