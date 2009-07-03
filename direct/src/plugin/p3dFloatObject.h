// Filename: p3dFloatObject.h
// Created by:  drose (30Jun09)
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

#ifndef P3DFLOATOBJECT_H
#define P3DFLOATOBJECT_H

#include "p3d_plugin_common.h"
#include "p3dObject.h"

////////////////////////////////////////////////////////////////////
//       Class : P3DFloatObject
// Description : An object type that contains a floating-point value.
////////////////////////////////////////////////////////////////////
class P3DFloatObject : public P3DObject {
public:
  P3DFloatObject(double value);
  P3DFloatObject(const P3DFloatObject &copy);

public:
  virtual P3DObject *make_copy() const; 
  virtual bool get_bool() const;
  virtual int get_int() const;
  virtual double get_float() const;
  virtual void make_string(string &value) const;

  virtual TiXmlElement *make_xml() const;

private:
  double _value;
};

#endif
