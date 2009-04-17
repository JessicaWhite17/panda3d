// Filename: iPhoneGraphicsPipe.mm
// Created by:  drose (08Apr09)
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

#include "iPhoneGraphicsPipe.h"
#include "config_iphone.h"
#include "iPhoneGraphicsWindow.h"
#include "iPhoneGraphicsStateGuardian.h"
#include "pnmImage.h"
#include "graphicsOutput.h"

IPhoneGraphicsPipe *IPhoneGraphicsPipe::_global_ptr;
TypeHandle IPhoneGraphicsPipe::_type_handle;

  
////////////////////////////////////////////////////////////////////
//     Function: IPhoneGraphicsPipe::Constructor
//       Access: Public
//  Description: 
////////////////////////////////////////////////////////////////////
IPhoneGraphicsPipe::
IPhoneGraphicsPipe() {
  CGRect screenBounds = [ [ UIScreen mainScreen ] bounds ]; 

  _window = [ [ UIWindow alloc ] initWithFrame: screenBounds ];
  _view_controller = [ [ ControllerDemoViewController alloc ] init ]; 

  [ _window addSubview:_view_controller.view ]; 
  [ _window makeKeyAndVisible ];
}

////////////////////////////////////////////////////////////////////
//     Function: IPhoneGraphicsPipe::Destructor
//       Access: Public, Virtual
//  Description: 
////////////////////////////////////////////////////////////////////
IPhoneGraphicsPipe::
~IPhoneGraphicsPipe() {
  [_view_controller release]; 
  [_window release]; 
}

////////////////////////////////////////////////////////////////////
//     Function: IPhoneGraphicsPipe::get_interface_name
//       Access: Published, Virtual
//  Description: Returns the name of the rendering interface
//               associated with this GraphicsPipe.  This is used to
//               present to the user to allow him/her to choose
//               between several possible GraphicsPipes available on a
//               particular platform, so the name should be meaningful
//               and unique for a given platform.
////////////////////////////////////////////////////////////////////
string IPhoneGraphicsPipe::
get_interface_name() const {
  return "OpenGL ES";
}

////////////////////////////////////////////////////////////////////
//     Function: IPhoneGraphicsPipe::pipe_constructor
//       Access: Public, Static
//  Description: This function is passed to the GraphicsPipeSelection
//               object to allow the user to make a default
//               IPhoneGraphicsPipe.
////////////////////////////////////////////////////////////////////
PT(GraphicsPipe) IPhoneGraphicsPipe::
pipe_constructor() {
  // There is only one IPhoneGraphicsPipe in the universe for any
  // given application.  Even if you ask for a new one, you just get
  // the same one you had before.
  if (_global_ptr == (IPhoneGraphicsPipe *)NULL) {
    _global_ptr = new IPhoneGraphicsPipe;
    _global_ptr->ref();
  }
  return _global_ptr;
}

////////////////////////////////////////////////////////////////////
//     Function: IPhoneGraphicsPipe::get_preferred_window_thread
//       Access: Public, Virtual
//  Description: Returns an indication of the thread in which this
//               GraphicsPipe requires its window processing to be
//               performed: typically either the app thread (e.g. X)
//               or the draw thread (Windows).
////////////////////////////////////////////////////////////////////
GraphicsPipe::PreferredWindowThread 
IPhoneGraphicsPipe::get_preferred_window_thread() const {
  return PWT_app;
}


////////////////////////////////////////////////////////////////////
//     Function: IPhoneGraphicsPipe::make_output
//       Access: Protected, Virtual
//  Description: Creates a new window on the pipe, if possible.
////////////////////////////////////////////////////////////////////
PT(GraphicsOutput) IPhoneGraphicsPipe::
make_output(const string &name,
            const FrameBufferProperties &fb_prop,
            const WindowProperties &win_prop,
            int flags,
            GraphicsEngine *engine,
            GraphicsStateGuardian *gsg,
            GraphicsOutput *host,
            int retry,
            bool &precertify) {
  if (!_is_valid) {
    return NULL;
  }

  IPhoneGraphicsStateGuardian *iphonegsg = 0;
  if (gsg != 0) {
    DCAST_INTO_R(iphonegsg, gsg, NULL);
  }
  
  // First thing to try: an IPhoneGraphicsWindow

  if (retry == 0) {
    if (((flags&BF_require_parasite)!=0)||
        ((flags&BF_refuse_window)!=0)||
        ((flags&BF_resizeable)!=0)||
        ((flags&BF_size_track_host)!=0)||
        ((flags&BF_can_bind_color)!=0)||
        ((flags&BF_can_bind_every)!=0)) {
      return NULL;
    }
    return new IPhoneGraphicsWindow(engine, this, name, fb_prop, win_prop,
                                    flags, gsg, host);
  }

  // Nothing else left to try.
  return NULL;
}