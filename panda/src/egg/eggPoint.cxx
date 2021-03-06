// Filename: eggPoint.cxx
// Created by:  drose (15Dec99)
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

#include "eggPoint.h"

#include "indent.h"

TypeHandle EggPoint::_type_handle;


////////////////////////////////////////////////////////////////////
//     Function: EggPoint::cleanup
//       Access: Public, Virtual
//  Description: Cleans up modeling errors in whatever context this
//               makes sense.  For instance, for a polygon, this calls
//               remove_doubled_verts(true).  For a point, it calls
//               remove_nonunique_verts().  Returns true if the
//               primitive is valid, or false if it is degenerate.
////////////////////////////////////////////////////////////////////
bool EggPoint::
cleanup() {
  remove_nonunique_verts();
  return !empty();
}

////////////////////////////////////////////////////////////////////
//     Function: EggPoint::write
//       Access: Public, Virtual
//  Description: Writes the point to the indicated output stream in
//               Egg format.
////////////////////////////////////////////////////////////////////
void EggPoint::
write(ostream &out, int indent_level) const {
  write_header(out, indent_level, "<PointLight>");

  if (has_thick()) {
    indent(out, indent_level + 2) 
      << "<Scalar> thick { " << get_thick() << " }\n";
  }

  if (has_perspective()) {
    indent(out, indent_level + 2) 
      << "<Scalar> perspective { " << get_perspective() << " }\n";
  }

  write_body(out, indent_level + 2);
  indent(out, indent_level) << "}\n";
}
