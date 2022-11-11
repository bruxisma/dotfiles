" Vim syntax file
" Language:     C OpenGL
" Maintainer:   Andreeshchev Eugene <admix@pisem.net>
" Version:      1.5
" Last Change:  2007-08-30

" Usage: 
"
"   Source it from somewhere
"
" Changelog: 
"
"   2007-08-30 (v1.5) 
"       * Added OpenGL ES 2.0 and EGL symbols
"          (thanks to Simon Hosie [sh1 at broadcom dot com]).
"       * Added following variables: 
"           c_opengl_no_gles2 - turns off GLES2 highlighting
"           c_opengl_no_egl - turns off EGL highlighting
"       * Now version numbering is a bit screwed =)
"
"   2003-11-07 (v1.4.1) 
"       * Added GLUT support
"          (thanks to Mathias Gumz [gumzat at cs dot uni-magdeburg dot de]).
"       * Added following variables: 
"           c_opengl_no_glu     - turns off GLU highlighting
"           c_opengl_no_glut    - turns off GLUT highlighting
"           c_opengl_no_ext_arb - turns off ARB extensions highlighting
"
"   2003-10-31 (v1.4) 
"       * Updated to OpenGL 1.4 ARB extensions for OpenGL Shading Language
"          (thanks to Eric Boumaour [zongo at nekeme dot net]).
"       * Now version number match OpenGL version.
"
"   2003-08-29 (v0.1)
"       Initial release
"
" TODO: add support for vendor specific extensions (NVidia and ATI at least)
"


" gl.h
" Data types {{{
syntax keyword glConstant GL_BYTE
syntax keyword glConstant GL_UNSIGNED_BYTE
syntax keyword glConstant GL_SHORT
syntax keyword glConstant GL_UNSIGNED_SHORT
syntax keyword glConstant GL_INT
syntax keyword glConstant GL_UNSIGNED_INT
syntax keyword glConstant GL_FLOAT
syntax keyword glConstant GL_DOUBLE
syntax keyword glConstant GL_2_BYTES
syntax keyword glConstant GL_3_BYTES
syntax keyword glConstant GL_4_BYTES

syntax keyword glType GLenum
syntax keyword glType GLboolean
syntax keyword glType GLbitfield
syntax keyword glType GLvoid
syntax keyword glType GLbyte
syntax keyword glType GLshort
syntax keyword glType GLint
syntax keyword glType GLubyte
syntax keyword glType GLushort
syntax keyword glType GLuint
syntax keyword glType GLsizei
syntax keyword glType GLfloat
syntax keyword glType GLclampf
syntax keyword glType GLdouble
syntax keyword glType GLclampd
" }}}
 
" Constants {{{

  syntax keyword glConstant GL_FALSE
  syntax keyword glConstant GL_TRUE

  " Primitives {{{
  syntax keyword glConstant GL_POINTS
  syntax keyword glConstant GL_LINES
  syntax keyword glConstant GL_LINE_LOOP
  syntax keyword glConstant GL_LINE_STRIP
  syntax keyword glConstant GL_TRIANGLES
  syntax keyword glConstant GL_TRIANGLE_STRIP
  syntax keyword glConstant GL_TRIANGLE_FAN
  syntax keyword glConstant GL_QUADS
  syntax keyword glConstant GL_QUAD_STRIP
  syntax keyword glConstant GL_POLYGON
  " }}}

  " Vertex Arrays {{{
  syntax keyword glConstant GL_VERTEX_ARRAY	      
  syntax keyword glConstant GL_NORMAL_ARRAY	      
  syntax keyword glConstant GL_COLOR_ARRAY	      
  syntax keyword glConstant GL_INDEX_ARRAY	      
  syntax keyword glConstant GL_TEXTURE_COORD_ARRAY
  syntax keyword glConstant GL_EDGE_FLAG_ARRAY    
  syntax keyword glConstant GL_VERTEX_ARRAY_SIZE  
  syntax keyword glConstant GL_VERTEX_ARRAY_TYPE  
  syntax keyword glConstant GL_VERTEX_ARRAY_STRIDE
  syntax keyword glConstant GL_NORMAL_ARRAY_TYPE  
  syntax keyword glConstant GL_NORMAL_ARRAY_STRIDE
  syntax keyword glConstant GL_COLOR_ARRAY_SIZE   
  syntax keyword glConstant GL_COLOR_ARRAY_TYPE   
  syntax keyword glConstant GL_COLOR_ARRAY_STRIDE 
  syntax keyword glConstant GL_INDEX_ARRAY_TYPE   
  syntax keyword glConstant GL_INDEX_ARRAY_STRIDE 
  syntax keyword glConstant GL_TEXTURE_COORD_ARRAY
  syntax keyword glConstant GL_TEXTURE_COORD_ARRAY
  syntax keyword glConstant GL_TEXTURE_COORD_ARRAY
  syntax keyword glConstant GL_EDGE_FLAG_ARRAY_STR
  syntax keyword glConstant GL_VERTEX_ARRAY_POINTE
  syntax keyword glConstant GL_NORMAL_ARRAY_POINTE
  syntax keyword glConstant GL_COLOR_ARRAY_POINTER
  syntax keyword glConstant GL_INDEX_ARRAY_POINTER
  syntax keyword glConstant GL_TEXTURE_COORD_ARRAY
  syntax keyword glConstant GL_EDGE_FLAG_ARRAY_POI
  syntax keyword glConstant GL_V2F		      
  syntax keyword glConstant GL_V3F		      
  syntax keyword glConstant GL_C4UB_V2F	      
  syntax keyword glConstant GL_C4UB_V3F	      
  syntax keyword glConstant GL_C3F_V3F	      
  syntax keyword glConstant GL_N3F_V3F	      
  syntax keyword glConstant GL_C4F_N3F_V3F	      
  syntax keyword glConstant GL_T2F_V3F	      
  syntax keyword glConstant GL_T4F_V4F	      
  syntax keyword glConstant GL_T2F_C4UB_V3F	      
  syntax keyword glConstant GL_T2F_C3F_V3F	      
  syntax keyword glConstant GL_T2F_N3F_V3F	      
  syntax keyword glConstant GL_T2F_C4F_N3F_V3F    
  syntax keyword glConstant GL_T4F_C4F_N3F_V4F    
  " }}}

  " Matrix Mode {{{
  syntax keyword glConstant GL_MATRIX_MODE
  syntax keyword glConstant GL_MODELVIEW  
  syntax keyword glConstant GL_PROJECTION 
  syntax keyword glConstant GL_TEXTURE    
  " }}}

  " Points {{{
  syntax keyword glConstant GL_POINT_SMOOTH      
  syntax keyword glConstant GL_POINT_SIZE        
  syntax keyword glConstant GL_POINT_SIZE_GRANULARITY
  syntax keyword glConstant GL_POINT_SIZE_RANGE  
  " }}}
                     
  " Lines {{{
  syntax keyword glConstant GL_LINE_SMOOTH         
  syntax keyword glConstant GL_LINE_STIPPLE        
  syntax keyword glConstant GL_LINE_STIPPLE_PATTERN    
  syntax keyword glConstant GL_LINE_STIPPLE_REPEAT     
  syntax keyword glConstant GL_LINE_WIDTH      
  syntax keyword glConstant GL_LINE_WIDTH_GRANULARITY
  syntax keyword glConstant GL_LINE_WIDTH_RANGE    
  " }}}

  " Polygons {{{
  syntax keyword glConstant GL_POINT        
  syntax keyword glConstant GL_LINE         
  syntax keyword glConstant GL_FILL         
  syntax keyword glConstant GL_CW           
  syntax keyword glConstant GL_CCW          
  syntax keyword glConstant GL_FRONT        
  syntax keyword glConstant GL_BACK         
  syntax keyword glConstant GL_POLYGON_MODE     
  syntax keyword glConstant GL_POLYGON_SMOOTH   
  syntax keyword glConstant GL_POLYGON_STIPPLE  
  syntax keyword glConstant GL_EDGE_FLAG        
  syntax keyword glConstant GL_CULL_FACE        
  syntax keyword glConstant GL_CULL_FACE_MODE   
  syntax keyword glConstant GL_FRONT_FACE       
  syntax keyword glConstant GL_POLYGON_OFFSET_FACTOR
  syntax keyword glConstant GL_POLYGON_OFFSET_UNITS 
  syntax keyword glConstant GL_POLYGON_OFFSET_POINT 
  syntax keyword glConstant GL_POLYGON_OFFSET_LINE  
  syntax keyword glConstant GL_POLYGON_OFFSET_FILL  
  " }}}

  " Display Lists {{{
  syntax keyword glConstant GL_COMPILE        
  syntax keyword glConstant GL_COMPILE_AND_EXECUTE
  syntax keyword glConstant GL_LIST_BASE          
  syntax keyword glConstant GL_LIST_INDEX         
  syntax keyword glConstant GL_LIST_MODE          
  " }}}

  " Depth buffer {{{
  syntax keyword glConstant GL_NEVER        
  syntax keyword glConstant GL_LESS         
  syntax keyword glConstant GL_EQUAL        
  syntax keyword glConstant GL_LEQUAL       
  syntax keyword glConstant GL_GREATER      
  syntax keyword glConstant GL_NOTEQUAL     
  syntax keyword glConstant GL_GEQUAL       
  syntax keyword glConstant GL_ALWAYS       
  syntax keyword glConstant GL_DEPTH_TEST       
  syntax keyword glConstant GL_DEPTH_BITS       
  syntax keyword glConstant GL_DEPTH_CLEAR_VALUE
  syntax keyword glConstant GL_DEPTH_FUNC       
  syntax keyword glConstant GL_DEPTH_RANGE      
  syntax keyword glConstant GL_DEPTH_WRITEMASK  
  syntax keyword glConstant GL_DEPTH_COMPONENT  
  " }}}

  " Lighting {{{
  syntax keyword glConstant GL_LIGHTING        
  syntax keyword glConstant GL_LIGHT0          
  syntax keyword glConstant GL_LIGHT1          
  syntax keyword glConstant GL_LIGHT2          
  syntax keyword glConstant GL_LIGHT3          
  syntax keyword glConstant GL_LIGHT4          
  syntax keyword glConstant GL_LIGHT5          
  syntax keyword glConstant GL_LIGHT6          
  syntax keyword glConstant GL_LIGHT7          
  syntax keyword glConstant GL_SPOT_EXPONENT       
  syntax keyword glConstant GL_SPOT_CUTOFF         
  syntax keyword glConstant GL_CONSTANT_ATTENUATION    
  syntax keyword glConstant GL_LINEAR_ATTENUATION      
  syntax keyword glConstant GL_QUADRATIC_ATTENUATION   
  syntax keyword glConstant GL_AMBIENT         
  syntax keyword glConstant GL_DIFFUSE         
  syntax keyword glConstant GL_SPECULAR        
  syntax keyword glConstant GL_SHININESS           
  syntax keyword glConstant GL_EMISSION        
  syntax keyword glConstant GL_POSITION        
  syntax keyword glConstant GL_SPOT_DIRECTION      
  syntax keyword glConstant GL_AMBIENT_AND_DIFFUSE     
  syntax keyword glConstant GL_COLOR_INDEXES       
  syntax keyword glConstant GL_LIGHT_MODEL_TWO_SIDE    
  syntax keyword glConstant GL_LIGHT_MODEL_LOCAL_VIEWER
  syntax keyword glConstant GL_LIGHT_MODEL_AMBIENT     
  syntax keyword glConstant GL_FRONT_AND_BACK      
  syntax keyword glConstant GL_SHADE_MODEL         
  syntax keyword glConstant GL_FLAT            
  syntax keyword glConstant GL_SMOOTH          
  syntax keyword glConstant GL_COLOR_MATERIAL      
  syntax keyword glConstant GL_COLOR_MATERIAL_FACE     
  syntax keyword glConstant GL_COLOR_MATERIAL_PARAMETER
  syntax keyword glConstant GL_NORMALIZE           
  " }}}

" Use clipping planes {{{
syntax keyword glConstant GL_CLIP_PLANE0
syntax keyword glConstant GL_CLIP_PLANE1
syntax keyword glConstant GL_CLIP_PLANE2
syntax keyword glConstant GL_CLIP_PLANE3
syntax keyword glConstant GL_CLIP_PLANE4
syntax keyword glConstant GL_CLIP_PLANE5
" }}}

" Accumulation buffer {{{
syntax keyword glConstant GL_ACCUM_RED_BITS   
syntax keyword glConstant GL_ACCUM_GREEN_BITS 
syntax keyword glConstant GL_ACCUM_BLUE_BITS  
syntax keyword glConstant GL_ACCUM_ALPHA_BITS 
syntax keyword glConstant GL_ACCUM_CLEAR_VALUE
syntax keyword glConstant GL_ACCUM        
syntax keyword glConstant GL_ADD          
syntax keyword glConstant GL_LOAD         
syntax keyword glConstant GL_MULT         
syntax keyword glConstant GL_RETURN       
" }}}
                
" Alpha testing {{{
syntax keyword glConstant GL_ALPHA_TEST      
syntax keyword glConstant GL_ALPHA_TEST_REF   
syntax keyword glConstant GL_ALPHA_TEST_FUNC  
" }}}

" Blending {{{
syntax keyword glConstant GL_BLEND           
syntax keyword glConstant GL_BLEND_SRC           
syntax keyword glConstant GL_BLEND_DST           
syntax keyword glConstant GL_ZERO            
syntax keyword glConstant GL_ONE             
syntax keyword glConstant GL_SRC_COLOR           
syntax keyword glConstant GL_ONE_MINUS_SRC_COLOR     
syntax keyword glConstant GL_SRC_ALPHA           
syntax keyword glConstant GL_ONE_MINUS_SRC_ALPHA     
syntax keyword glConstant GL_DST_ALPHA           
syntax keyword glConstant GL_ONE_MINUS_DST_ALPHA     
syntax keyword glConstant GL_DST_COLOR           
syntax keyword glConstant GL_ONE_MINUS_DST_COLOR     
syntax keyword glConstant GL_SRC_ALPHA_SATURATE      
syntax keyword glConstant GL_CONSTANT_COLOR      
syntax keyword glConstant GL_ONE_MINUS_CONSTANT_COLOR
syntax keyword glConstant GL_CONSTANT_ALPHA      
syntax keyword glConstant GL_ONE_MINUS_CONSTANT_ALPHA
" }}}

" Render mode {{{
syntax keyword glConstant GL_FEEDBACK
syntax keyword glConstant GL_RENDER  
syntax keyword glConstant GL_SELECT  
" }}}

  " Feedback {{{
  syntax keyword glConstant GL_2D             
  syntax keyword glConstant GL_3D             
  syntax keyword glConstant GL_3D_COLOR       
  syntax keyword glConstant GL_3D_COLOR_TEXTURE   
  syntax keyword glConstant GL_4D_COLOR_TEXTURE   
  syntax keyword glConstant GL_POINT_TOKEN        
  syntax keyword glConstant GL_LINE_TOKEN         
  syntax keyword glConstant GL_LINE_RESET_TOKEN   
  syntax keyword glConstant GL_POLYGON_TOKEN      
  syntax keyword glConstant GL_BITMAP_TOKEN       
  syntax keyword glConstant GL_DRAW_PIXEL_TOKEN   
  syntax keyword glConstant GL_COPY_PIXEL_TOKEN   
  syntax keyword glConstant GL_PASS_THROUGH_TOKEN     
  syntax keyword glConstant GL_FEEDBACK_BUFFER_POINTER
  syntax keyword glConstant GL_FEEDBACK_BUFFER_SIZE   
  syntax keyword glConstant GL_FEEDBACK_BUFFER_TYPE   
  " }}}

  " Selection {{{
  syntax keyword glConstant GL_SELECTION_BUFFER_POINTER
  syntax keyword glConstant GL_SELECTION_BUFFER_SIZE   
  " }}}

  " Fog {{{
  syntax keyword glConstant GL_FOG        
  syntax keyword glConstant GL_FOG_MODE   
  syntax keyword glConstant GL_FOG_DENSITY
  syntax keyword glConstant GL_FOG_COLOR  
  syntax keyword glConstant GL_FOG_INDEX  
  syntax keyword glConstant GL_FOG_START  
  syntax keyword glConstant GL_FOG_END    
  syntax keyword glConstant GL_LINEAR     
  syntax keyword glConstant GL_EXP        
  syntax keyword glConstant GL_EXP2       
  " }}}

  " Logic ops {{{
  syntax keyword glConstant GL_LOGIC_OP  
  syntax keyword glConstant GL_INDEX_LOGIC_OP
  syntax keyword glConstant GL_COLOR_LOGIC_OP
  syntax keyword glConstant GL_LOGIC_OP_MODE 
  syntax keyword glConstant GL_CLEAR     
  syntax keyword glConstant GL_SET       
  syntax keyword glConstant GL_COPY      
  syntax keyword glConstant GL_COPY_INVERTED 
  syntax keyword glConstant GL_NOOP      
  syntax keyword glConstant GL_INVERT    
  syntax keyword glConstant GL_AND       
  syntax keyword glConstant GL_NAND      
  syntax keyword glConstant GL_OR        
  syntax keyword glConstant GL_NOR       
  syntax keyword glConstant GL_XOR       
  syntax keyword glConstant GL_EQUIV     
  syntax keyword glConstant GL_AND_REVERSE   
  syntax keyword glConstant GL_AND_INVERTED  
  syntax keyword glConstant GL_OR_REVERSE    
  syntax keyword glConstant GL_OR_INVERTED   
  " }}}

  " Stencil {{{
  syntax keyword glConstant GL_STENCIL_TEST       
  syntax keyword glConstant GL_STENCIL_WRITEMASK      
  syntax keyword glConstant GL_STENCIL_BITS       
  syntax keyword glConstant GL_STENCIL_FUNC       
  syntax keyword glConstant GL_STENCIL_VALUE_MASK     
  syntax keyword glConstant GL_STENCIL_REF        
  syntax keyword glConstant GL_STENCIL_FAIL       
  syntax keyword glConstant GL_STENCIL_PASS_DEPTH_PASS
  syntax keyword glConstant GL_STENCIL_PASS_DEPTH_FAIL
  syntax keyword glConstant GL_STENCIL_CLEAR_VALUE    
  syntax keyword glConstant GL_STENCIL_INDEX      
  syntax keyword glConstant GL_KEEP           
  syntax keyword glConstant GL_REPLACE        
  syntax keyword glConstant GL_INCR           
  syntax keyword glConstant GL_DECR           
  " }}}

  " Buffers, Pixel Drawing/Reading {{{
  syntax keyword glConstant GL_NONE        
  syntax keyword glConstant GL_LEFT        
  syntax keyword glConstant GL_RIGHT       
  syntax keyword glConstant GL_FRONT_LEFT  
  syntax keyword glConstant GL_FRONT_RIGHT 
  syntax keyword glConstant GL_BACK_LEFT   
  syntax keyword glConstant GL_BACK_RIGHT  
  syntax keyword glConstant GL_AUX0        
  syntax keyword glConstant GL_AUX1        
  syntax keyword glConstant GL_AUX2        
  syntax keyword glConstant GL_AUX3        
  syntax keyword glConstant GL_COLOR_INDEX 
  syntax keyword glConstant GL_RED         
  syntax keyword glConstant GL_GREEN       
  syntax keyword glConstant GL_BLUE        
  syntax keyword glConstant GL_ALPHA       
  syntax keyword glConstant GL_LUMINANCE   
  syntax keyword glConstant GL_LUMINANCE_AL
  syntax keyword glConstant GL_ALPHA_BITS  
  syntax keyword glConstant GL_RED_BITS    
  syntax keyword glConstant GL_GREEN_BITS  
  syntax keyword glConstant GL_BLUE_BITS   
  syntax keyword glConstant GL_INDEX_BITS  
  syntax keyword glConstant GL_SUBPIXEL_BIT
  syntax keyword glConstant GL_AUX_BUFFERS 
  syntax keyword glConstant GL_READ_BUFFER 
  syntax keyword glConstant GL_DRAW_BUFFER 
  syntax keyword glConstant GL_DOUBLEBUFFER
  syntax keyword glConstant GL_STEREO      
  syntax keyword glConstant GL_BITMAP      
  syntax keyword glConstant GL_COLOR       
  syntax keyword glConstant GL_DEPTH       
  syntax keyword glConstant GL_STENCIL     
  syntax keyword glConstant GL_DITHER      
  syntax keyword glConstant GL_RGB         
  syntax keyword glConstant GL_RGBA        
  " }}}

  " Implementation limits {{{
  syntax keyword glConstant GL_MAX_LIST_NESTING        
  syntax keyword glConstant GL_MAX_ATTRIB_STACK_DEPTH  
  syntax keyword glConstant GL_MAX_MODELVIEW_STACK_DEPTH   
  syntax keyword glConstant GL_MAX_NAME_STACK_DEPTH        
  syntax keyword glConstant GL_MAX_PROJECTION_STACK_DEPTH  
  syntax keyword glConstant GL_MAX_TEXTURE_STACK_DEPTH 
  syntax keyword glConstant GL_MAX_EVAL_ORDER      
  syntax keyword glConstant GL_MAX_LIGHTS          
  syntax keyword glConstant GL_MAX_CLIP_PLANES     
  syntax keyword glConstant GL_MAX_TEXTURE_SIZE        
  syntax keyword glConstant GL_MAX_PIXEL_MAP_TABLE     
  syntax keyword glConstant GL_MAX_VIEWPORT_DIMS       
  syntax keyword glConstant GL_MAX_CLIENT_ATTRIB_STACK_DEPTH 
  " }}}

  " Gets {{{
  syntax keyword glConstant GL_ATTRIB_STACK_DEPTH       
  syntax keyword glConstant GL_CLIENT_ATTRIB_STACK_DEPTH    
  syntax keyword glConstant GL_COLOR_CLEAR_VALUE        
  syntax keyword glConstant GL_COLOR_WRITEMASK      
  syntax keyword glConstant GL_CURRENT_INDEX        
  syntax keyword glConstant GL_CURRENT_COLOR        
  syntax keyword glConstant GL_CURRENT_NORMAL       
  syntax keyword glConstant GL_CURRENT_RASTER_COLOR     
  syntax keyword glConstant GL_CURRENT_RASTER_DISTANCE  
  syntax keyword glConstant GL_CURRENT_RASTER_INDEX     
  syntax keyword glConstant GL_CURRENT_RASTER_POSITION  
  syntax keyword glConstant GL_CURRENT_RASTER_TEXTURE_COORDS
  syntax keyword glConstant GL_CURRENT_RASTER_POSITION_VALID
  syntax keyword glConstant GL_CURRENT_TEXTURE_COORDS   
  syntax keyword glConstant GL_INDEX_CLEAR_VALUE        
  syntax keyword glConstant GL_INDEX_MODE           
  syntax keyword glConstant GL_INDEX_WRITEMASK      
  syntax keyword glConstant GL_MODELVIEW_MATRIX     
  syntax keyword glConstant GL_MODELVIEW_STACK_DEPTH    
  syntax keyword glConstant GL_NAME_STACK_DEPTH     
  syntax keyword glConstant GL_PROJECTION_MATRIX        
  syntax keyword glConstant GL_PROJECTION_STACK_DEPTH   
  syntax keyword glConstant GL_RENDER_MODE          
  syntax keyword glConstant GL_RGBA_MODE            
  syntax keyword glConstant GL_TEXTURE_MATRIX       
  syntax keyword glConstant GL_TEXTURE_STACK_DEPTH      
  syntax keyword glConstant GL_VIEWPORT         
  " }}}

  " Evaluators {{{
  syntax keyword glConstant GL_AUTO_NORMAL         
  syntax keyword glConstant GL_MAP1_COLOR_4        
  syntax keyword glConstant GL_MAP1_GRID_DOMAIN    
  syntax keyword glConstant GL_MAP1_GRID_SEGMENTS  
  syntax keyword glConstant GL_MAP1_INDEX          
  syntax keyword glConstant GL_MAP1_NORMAL         
  syntax keyword glConstant GL_MAP1_TEXTURE_COORD_1
  syntax keyword glConstant GL_MAP1_TEXTURE_COORD_2
  syntax keyword glConstant GL_MAP1_TEXTURE_COORD_3
  syntax keyword glConstant GL_MAP1_TEXTURE_COORD_4
  syntax keyword glConstant GL_MAP1_VERTEX_3       
  syntax keyword glConstant GL_MAP1_VERTEX_4       
  syntax keyword glConstant GL_MAP2_COLOR_4        
  syntax keyword glConstant GL_MAP2_GRID_DOMAIN    
  syntax keyword glConstant GL_MAP2_GRID_SEGMENTS  
  syntax keyword glConstant GL_MAP2_INDEX          
  syntax keyword glConstant GL_MAP2_NORMAL         
  syntax keyword glConstant GL_MAP2_TEXTURE_COORD_1
  syntax keyword glConstant GL_MAP2_TEXTURE_COORD_2
  syntax keyword glConstant GL_MAP2_TEXTURE_COORD_3
  syntax keyword glConstant GL_MAP2_TEXTURE_COORD_4
  syntax keyword glConstant GL_MAP2_VERTEX_3       
  syntax keyword glConstant GL_MAP2_VERTEX_4       
  syntax keyword glConstant GL_COEFF           
  syntax keyword glConstant GL_DOMAIN          
  syntax keyword glConstant GL_ORDER           
  " }}}

  " Hints {{{
  syntax keyword glConstant GL_FOG_HINT           
  syntax keyword glConstant GL_LINE_SMOOTH_HINT       
  syntax keyword glConstant GL_PERSPECTIVE_CORRECTION_HINT
  syntax keyword glConstant GL_POINT_SMOOTH_HINT          
  syntax keyword glConstant GL_POLYGON_SMOOTH_HINT        
  syntax keyword glConstant GL_DONT_CARE              
  syntax keyword glConstant GL_FASTEST            
  syntax keyword glConstant GL_NICEST             
  " }}}

" Scissor box {{{
syntax keyword glConstant GL_SCISSOR_TEST
syntax keyword glConstant GL_SCISSOR_BOX 
" }}}

" Pixel Mode / Transfer {{{
syntax keyword glConstant GL_MAP_COLOR        
syntax keyword glConstant GL_MAP_STENCIL      
syntax keyword glConstant GL_INDEX_SHIFT      
syntax keyword glConstant GL_INDEX_OFFSET     
syntax keyword glConstant GL_RED_SCALE        
syntax keyword glConstant GL_RED_BIAS     
syntax keyword glConstant GL_GREEN_SCALE      
syntax keyword glConstant GL_GREEN_BIAS       
syntax keyword glConstant GL_BLUE_SCALE       
syntax keyword glConstant GL_BLUE_BIAS        
syntax keyword glConstant GL_ALPHA_SCALE      
syntax keyword glConstant GL_ALPHA_BIAS       
syntax keyword glConstant GL_DEPTH_SCALE      
syntax keyword glConstant GL_DEPTH_BIAS       
syntax keyword glConstant GL_PIXEL_MAP_S_TO_S_SIZE
syntax keyword glConstant GL_PIXEL_MAP_I_TO_I_SIZE
syntax keyword glConstant GL_PIXEL_MAP_I_TO_R_SIZE
syntax keyword glConstant GL_PIXEL_MAP_I_TO_G_SIZE
syntax keyword glConstant GL_PIXEL_MAP_I_TO_B_SIZE
syntax keyword glConstant GL_PIXEL_MAP_I_TO_A_SIZE
syntax keyword glConstant GL_PIXEL_MAP_R_TO_R_SIZE
syntax keyword glConstant GL_PIXEL_MAP_G_TO_G_SIZE
syntax keyword glConstant GL_PIXEL_MAP_B_TO_B_SIZE
syntax keyword glConstant GL_PIXEL_MAP_A_TO_A_SIZE
syntax keyword glConstant GL_PIXEL_MAP_S_TO_S 
syntax keyword glConstant GL_PIXEL_MAP_I_TO_I 
syntax keyword glConstant GL_PIXEL_MAP_I_TO_R 
syntax keyword glConstant GL_PIXEL_MAP_I_TO_G 
syntax keyword glConstant GL_PIXEL_MAP_I_TO_B 
syntax keyword glConstant GL_PIXEL_MAP_I_TO_A 
syntax keyword glConstant GL_PIXEL_MAP_R_TO_R 
syntax keyword glConstant GL_PIXEL_MAP_G_TO_G 
syntax keyword glConstant GL_PIXEL_MAP_B_TO_B 
syntax keyword glConstant GL_PIXEL_MAP_A_TO_A 
syntax keyword glConstant GL_PACK_ALIGNMENT   
syntax keyword glConstant GL_PACK_LSB_FIRST   
syntax keyword glConstant GL_PACK_ROW_LENGTH  
syntax keyword glConstant GL_PACK_SKIP_PIXELS 
syntax keyword glConstant GL_PACK_SKIP_ROWS   
syntax keyword glConstant GL_PACK_SWAP_BYTES  
syntax keyword glConstant GL_UNPACK_ALIGNMENT 
syntax keyword glConstant GL_UNPACK_ROW_LENGTH    
syntax keyword glConstant GL_UNPACK_SKIP_PIXELS   
syntax keyword glConstant GL_UNPACK_SKIP_ROWS 
syntax keyword glConstant GL_UNPACK_SWAP_BYTES    
syntax keyword glConstant GL_ZOOM_X       
syntax keyword glConstant GL_ZOOM_Y       
" }}}

" Texture mapping {{{
syntax keyword glConstant GL_TEXTURE_ENV       
syntax keyword glConstant GL_TEXTURE_ENV_MODE  
syntax keyword glConstant GL_TEXTURE_1D        
syntax keyword glConstant GL_TEXTURE_2D        
syntax keyword glConstant GL_TEXTURE_WRAP_S    
syntax keyword glConstant GL_TEXTURE_WRAP_T    
syntax keyword glConstant GL_TEXTURE_MAG_FILTER    
syntax keyword glConstant GL_TEXTURE_MIN_FILTER    
syntax keyword glConstant GL_TEXTURE_ENV_COLOR     
syntax keyword glConstant GL_TEXTURE_GEN_S     
syntax keyword glConstant GL_TEXTURE_GEN_T     
syntax keyword glConstant GL_TEXTURE_GEN_MODE  
syntax keyword glConstant GL_TEXTURE_BORDER_COLOR  
syntax keyword glConstant GL_TEXTURE_WIDTH     
syntax keyword glConstant GL_TEXTURE_HEIGHT    
syntax keyword glConstant GL_TEXTURE_BORDER    
syntax keyword glConstant GL_TEXTURE_COMPONENTS    
syntax keyword glConstant GL_TEXTURE_RED_SIZE  
syntax keyword glConstant GL_TEXTURE_GREEN_SIZE    
syntax keyword glConstant GL_TEXTURE_BLUE_SIZE     
syntax keyword glConstant GL_TEXTURE_ALPHA_SIZE    
syntax keyword glConstant GL_TEXTURE_LUMINANCE_SIZE
syntax keyword glConstant GL_TEXTURE_INTENSITY_SIZE
syntax keyword glConstant GL_NEAREST_MIPMAP_NEAREST
syntax keyword glConstant GL_NEAREST_MIPMAP_LINEAR 
syntax keyword glConstant GL_LINEAR_MIPMAP_NEAREST 
syntax keyword glConstant GL_LINEAR_MIPMAP_LINEAR  
syntax keyword glConstant GL_OBJECT_LINEAR     
syntax keyword glConstant GL_OBJECT_PLANE      
syntax keyword glConstant GL_EYE_LINEAR        
syntax keyword glConstant GL_EYE_PLANE         
syntax keyword glConstant GL_SPHERE_MAP        
syntax keyword glConstant GL_DECAL         
syntax keyword glConstant GL_MODULATE      
syntax keyword glConstant GL_NEAREST       
syntax keyword glConstant GL_REPEAT        
syntax keyword glConstant GL_CLAMP         
syntax keyword glConstant GL_S             
syntax keyword glConstant GL_T             
syntax keyword glConstant GL_R             
syntax keyword glConstant GL_Q             
syntax keyword glConstant GL_TEXTURE_GEN_R     
syntax keyword glConstant GL_TEXTURE_GEN_Q     
"}}}

" Utility {{{
syntax keyword glConstant GL_VENDOR    
syntax keyword glConstant GL_RENDERER  
syntax keyword glConstant GL_VERSION   
syntax keyword glConstant GL_EXTENSIONS
"}}}

" Errors {{{
syntax keyword glConstant GL_NO_ERROR         
syntax keyword glConstant GL_INVALID_VALUE    
syntax keyword glConstant GL_INVALID_ENUM     
syntax keyword glConstant GL_INVALID_OPERATION
syntax keyword glConstant GL_STACK_OVERFLOW   
syntax keyword glConstant GL_STACK_UNDERFLOW  
syntax keyword glConstant GL_OUT_OF_MEMORY    
"}}}

" glPush/PopAttrib bits {{{
syntax keyword glConstant GL_CURRENT_BIT        
syntax keyword glConstant GL_POINT_BIT          
syntax keyword glConstant GL_LINE_BIT       
syntax keyword glConstant GL_POLYGON_BIT        
syntax keyword glConstant GL_POLYGON_STIPPLE_BIT
syntax keyword glConstant GL_PIXEL_MODE_BIT     
syntax keyword glConstant GL_LIGHTING_BIT       
syntax keyword glConstant GL_FOG_BIT        
syntax keyword glConstant GL_DEPTH_BUFFER_BIT   
syntax keyword glConstant GL_ACCUM_BUFFER_BIT   
syntax keyword glConstant GL_STENCIL_BUFFER_BIT 
syntax keyword glConstant GL_VIEWPORT_BIT       
syntax keyword glConstant GL_TRANSFORM_BIT      
syntax keyword glConstant GL_ENABLE_BIT         
syntax keyword glConstant GL_COLOR_BUFFER_BIT   
syntax keyword glConstant GL_HINT_BIT       
syntax keyword glConstant GL_EVAL_BIT       
syntax keyword glConstant GL_LIST_BIT       
syntax keyword glConstant GL_TEXTURE_BIT        
syntax keyword glConstant GL_SCISSOR_BIT        
syntax keyword glConstant GL_ALL_ATTRIB_BITS    
"}}}

" OpenGL 1.1 {{{
syntax keyword glConstant GL_PROXY_TEXTURE_1D   
syntax keyword glConstant GL_PROXY_TEXTURE_2D   
syntax keyword glConstant GL_TEXTURE_PRIORITY   
syntax keyword glConstant GL_TEXTURE_RESIDENT   
syntax keyword glConstant GL_TEXTURE_BINDING_1D     
syntax keyword glConstant GL_TEXTURE_BINDING_2D     
syntax keyword glConstant GL_TEXTURE_INTERNAL_FORMAT
syntax keyword glConstant GL_ALPHA4         
syntax keyword glConstant GL_ALPHA8         
syntax keyword glConstant GL_ALPHA12        
syntax keyword glConstant GL_ALPHA16        
syntax keyword glConstant GL_LUMINANCE4         
syntax keyword glConstant GL_LUMINANCE8         
syntax keyword glConstant GL_LUMINANCE12        
syntax keyword glConstant GL_LUMINANCE16        
syntax keyword glConstant GL_LUMINANCE4_ALPHA4      
syntax keyword glConstant GL_LUMINANCE6_ALPHA2      
syntax keyword glConstant GL_LUMINANCE8_ALPHA8      
syntax keyword glConstant GL_LUMINANCE12_ALPHA4     
syntax keyword glConstant GL_LUMINANCE12_ALPHA12    
syntax keyword glConstant GL_LUMINANCE16_ALPHA16    
syntax keyword glConstant GL_INTENSITY          
syntax keyword glConstant GL_INTENSITY4         
syntax keyword glConstant GL_INTENSITY8         
syntax keyword glConstant GL_INTENSITY12        
syntax keyword glConstant GL_INTENSITY16        
syntax keyword glConstant GL_R3_G3_B2       
syntax keyword glConstant GL_RGB4           
syntax keyword glConstant GL_RGB5           
syntax keyword glConstant GL_RGB8           
syntax keyword glConstant GL_RGB10          
syntax keyword glConstant GL_RGB12          
syntax keyword glConstant GL_RGB16          
syntax keyword glConstant GL_RGBA2          
syntax keyword glConstant GL_RGBA4          
syntax keyword glConstant GL_RGB5_A1        
syntax keyword glConstant GL_RGBA8          
syntax keyword glConstant GL_RGB10_A2       
syntax keyword glConstant GL_RGBA12         
syntax keyword glConstant GL_RGBA16         
syntax keyword glConstant GL_CLIENT_PIXEL_STORE_BIT 
syntax keyword glConstant GL_CLIENT_VERTEX_ARRAY_BIT
syntax keyword glConstant GL_ALL_CLIENT_ATTRIB_BITS 
syntax keyword glConstant GL_CLIENT_ALL_ATTRIB_BITS 
"}}}

" OpenGL 1.2 {{{
syntax keyword glConstant GL_RESCALE_NORMAL       
syntax keyword glConstant GL_CLAMP_TO_EDGE        
syntax keyword glConstant GL_MAX_ELEMENTS_VERTICES    
syntax keyword glConstant GL_MAX_ELEMENTS_INDICES     
syntax keyword glConstant GL_BGR              
syntax keyword glConstant GL_BGRA             
syntax keyword glConstant GL_UNSIGNED_BYTE_3_3_2      
syntax keyword glConstant GL_UNSIGNED_BYTE_2_3_3_REV  
syntax keyword glConstant GL_UNSIGNED_SHORT_5_6_5     
syntax keyword glConstant GL_UNSIGNED_SHORT_5_6_5_REV 
syntax keyword glConstant GL_UNSIGNED_SHORT_4_4_4_4   
syntax keyword glConstant GL_UNSIGNED_SHORT_4_4_4_4_REV   
syntax keyword glConstant GL_UNSIGNED_SHORT_5_5_5_1   
syntax keyword glConstant GL_UNSIGNED_SHORT_1_5_5_5_REV   
syntax keyword glConstant GL_UNSIGNED_INT_8_8_8_8     
syntax keyword glConstant GL_UNSIGNED_INT_8_8_8_8_REV 
syntax keyword glConstant GL_UNSIGNED_INT_10_10_10_2  
syntax keyword glConstant GL_UNSIGNED_INT_2_10_10_10_REV  
syntax keyword glConstant GL_LIGHT_MODEL_COLOR_CONTROL    
syntax keyword glConstant GL_SINGLE_COLOR         
syntax keyword glConstant GL_SEPARATE_SPECULAR_COLOR  
syntax keyword glConstant GL_TEXTURE_MIN_LOD      
syntax keyword glConstant GL_TEXTURE_MAX_LOD      
syntax keyword glConstant GL_TEXTURE_BASE_LEVEL       
syntax keyword glConstant GL_TEXTURE_MAX_LEVEL        
syntax keyword glConstant GL_SMOOTH_POINT_SIZE_RANGE  
syntax keyword glConstant GL_SMOOTH_POINT_SIZE_GRANULARITY
syntax keyword glConstant GL_SMOOTH_LINE_WIDTH_RANGE  
syntax keyword glConstant GL_SMOOTH_LINE_WIDTH_GRANULARITY
syntax keyword glConstant GL_ALIASED_POINT_SIZE_RANGE 
syntax keyword glConstant GL_ALIASED_LINE_WIDTH_RANGE 
syntax keyword glConstant GL_PACK_SKIP_IMAGES     
syntax keyword glConstant GL_PACK_IMAGE_HEIGHT        
syntax keyword glConstant GL_UNPACK_SKIP_IMAGES       
syntax keyword glConstant GL_UNPACK_IMAGE_HEIGHT      
syntax keyword glConstant GL_TEXTURE_3D           
syntax keyword glConstant GL_PROXY_TEXTURE_3D     
syntax keyword glConstant GL_TEXTURE_DEPTH        
syntax keyword glConstant GL_TEXTURE_WRAP_R       
syntax keyword glConstant GL_MAX_3D_TEXTURE_SIZE      
syntax keyword glConstant GL_TEXTURE_BINDING_3D       
"}}}

" OpenGL 1.3 {{{
syntax keyword glConstant GL_TEXTURE0          
syntax keyword glConstant GL_TEXTURE1          
syntax keyword glConstant GL_TEXTURE2          
syntax keyword glConstant GL_TEXTURE3          
syntax keyword glConstant GL_TEXTURE4          
syntax keyword glConstant GL_TEXTURE5          
syntax keyword glConstant GL_TEXTURE6          
syntax keyword glConstant GL_TEXTURE7          
syntax keyword glConstant GL_TEXTURE8          
syntax keyword glConstant GL_TEXTURE9          
syntax keyword glConstant GL_TEXTURE10             
syntax keyword glConstant GL_TEXTURE11             
syntax keyword glConstant GL_TEXTURE12             
syntax keyword glConstant GL_TEXTURE13             
syntax keyword glConstant GL_TEXTURE14             
syntax keyword glConstant GL_TEXTURE15             
syntax keyword glConstant GL_TEXTURE16             
syntax keyword glConstant GL_TEXTURE17             
syntax keyword glConstant GL_TEXTURE18             
syntax keyword glConstant GL_TEXTURE19             
syntax keyword glConstant GL_TEXTURE20             
syntax keyword glConstant GL_TEXTURE21             
syntax keyword glConstant GL_TEXTURE22             
syntax keyword glConstant GL_TEXTURE23             
syntax keyword glConstant GL_TEXTURE24             
syntax keyword glConstant GL_TEXTURE25             
syntax keyword glConstant GL_TEXTURE26             
syntax keyword glConstant GL_TEXTURE27             
syntax keyword glConstant GL_TEXTURE28             
syntax keyword glConstant GL_TEXTURE29             
syntax keyword glConstant GL_TEXTURE30             
syntax keyword glConstant GL_TEXTURE31             
syntax keyword glConstant GL_ACTIVE_TEXTURE        
syntax keyword glConstant GL_CLIENT_ACTIVE_TEXTURE     
syntax keyword glConstant GL_MAX_TEXTURE_UNITS         
syntax keyword glConstant GL_NORMAL_MAP            
syntax keyword glConstant GL_REFLECTION_MAP        
syntax keyword glConstant GL_TEXTURE_CUBE_MAP      
syntax keyword glConstant GL_TEXTURE_BINDING_CUBE_MAP  
syntax keyword glConstant GL_TEXTURE_CUBE_MAP_POSITIVE_X   
syntax keyword glConstant GL_TEXTURE_CUBE_MAP_NEGATIVE_X   
syntax keyword glConstant GL_TEXTURE_CUBE_MAP_POSITIVE_Y   
syntax keyword glConstant GL_TEXTURE_CUBE_MAP_NEGATIVE_Y   
syntax keyword glConstant GL_TEXTURE_CUBE_MAP_POSITIVE_Z   
syntax keyword glConstant GL_TEXTURE_CUBE_MAP_NEGATIVE_Z   
syntax keyword glConstant GL_PROXY_TEXTURE_CUBE_MAP    
syntax keyword glConstant GL_MAX_CUBE_MAP_TEXTURE_SIZE     
syntax keyword glConstant GL_COMPRESSED_ALPHA      
syntax keyword glConstant GL_COMPRESSED_LUMINANCE      
syntax keyword glConstant GL_COMPRESSED_LUMINANCE_ALPHA    
syntax keyword glConstant GL_COMPRESSED_INTENSITY      
syntax keyword glConstant GL_COMPRESSED_RGB        
syntax keyword glConstant GL_COMPRESSED_RGBA       
syntax keyword glConstant GL_TEXTURE_COMPRESSION_HINT  
syntax keyword glConstant GL_TEXTURE_COMPRESSED_IMAGE_SIZE 
syntax keyword glConstant GL_TEXTURE_COMPRESSED        
syntax keyword glConstant GL_NUM_COMPRESSED_TEXTURE_FORMATS
syntax keyword glConstant GL_COMPRESSED_TEXTURE_FORMATS    
syntax keyword glConstant GL_MULTISAMPLE           
syntax keyword glConstant GL_SAMPLE_ALPHA_TO_COVERAGE  
syntax keyword glConstant GL_SAMPLE_ALPHA_TO_ONE       
syntax keyword glConstant GL_SAMPLE_COVERAGE       
syntax keyword glConstant GL_SAMPLE_BUFFERS        
syntax keyword glConstant GL_SAMPLES           
syntax keyword glConstant GL_SAMPLE_COVERAGE_VALUE     
syntax keyword glConstant GL_SAMPLE_COVERAGE_INVERT    
syntax keyword glConstant GL_MULTISAMPLE_BIT       
syntax keyword glConstant GL_TRANSPOSE_MODELVIEW_MATRIX    
syntax keyword glConstant GL_TRANSPOSE_PROJECTION_MATRIX   
syntax keyword glConstant GL_TRANSPOSE_TEXTURE_MATRIX  
syntax keyword glConstant GL_TRANSPOSE_COLOR_MATRIX    
syntax keyword glConstant GL_COMBINE           
syntax keyword glConstant GL_COMBINE_RGB           
syntax keyword glConstant GL_COMBINE_ALPHA         
syntax keyword glConstant GL_SOURCE0_RGB           
syntax keyword glConstant GL_SOURCE1_RGB           
syntax keyword glConstant GL_SOURCE2_RGB           
syntax keyword glConstant GL_SOURCE0_ALPHA         
syntax keyword glConstant GL_SOURCE1_ALPHA         
syntax keyword glConstant GL_SOURCE2_ALPHA         
syntax keyword glConstant GL_OPERAND0_RGB          
syntax keyword glConstant GL_OPERAND1_RGB          
syntax keyword glConstant GL_OPERAND2_RGB          
syntax keyword glConstant GL_OPERAND0_ALPHA        
syntax keyword glConstant GL_OPERAND1_ALPHA        
syntax keyword glConstant GL_OPERAND2_ALPHA        
syntax keyword glConstant GL_RGB_SCALE             
syntax keyword glConstant GL_ADD_SIGNED            
syntax keyword glConstant GL_INTERPOLATE           
syntax keyword glConstant GL_SUBTRACT          
syntax keyword glConstant GL_CONSTANT          
syntax keyword glConstant GL_PRIMARY_COLOR         
syntax keyword glConstant GL_PREVIOUS          
syntax keyword glConstant GL_DOT3_RGB          
syntax keyword glConstant GL_DOT3_RGBA             
syntax keyword glConstant GL_CLAMP_TO_BORDER       
"}}}

" OpenGL 1.4 {{{
syntax keyword glConstant GL_GENERATE_MIPMAP
syntax keyword glConstant GL_GENERATE_MIPMAP_HINT
syntax keyword glConstant GL_BLEND_COLOR
syntax keyword glConstant GL_DEPTH_COMPONENT16
syntax keyword glConstant GL_DEPTH_COMPONENT24
syntax keyword glConstant GL_DEPTH_COMPONENT32
syntax keyword glConstant GL_TEXTURE_DEPTH_SIZE
syntax keyword glConstant GL_DEPTH_TEXTURE_MODE
syntax keyword glConstant GL_TEXTURE_COMPARE_MODE
syntax keyword glConstant GL_TEXTURE_COMPARE_FUNC
syntax keyword glConstant GL_COMPARE_R_TO_TEXTURE
syntax keyword glConstant GL_FOG_COORDINATE_SOURCE
syntax keyword glConstant GL_FOG_COORDINATE
syntax keyword glConstant GL_FRAGMENT_DEPTH
syntax keyword glConstant GL_CURRENT_FOG_COORDINATE
syntax keyword glConstant GL_FOG_COORDINATE_ARRAY_TYPE
syntax keyword glConstant GL_FOG_COORDINATE_ARRAY_STRIDE
syntax keyword glConstant GL_FOG_COORDINATE_ARRAY_POINTER
syntax keyword glConstant GL_FOG_COORDINATE_ARRAY
syntax keyword glConstant GL_POINT_SIZE_MIN
syntax keyword glConstant GL_POINT_SIZE_MAX
syntax keyword glConstant GL_POINT_FADE_THRESHOLD_SIZE
syntax keyword glConstant GL_POINT_DISTANCE_ATTENUATION
syntax keyword glConstant GL_COLOR_SUM
syntax keyword glConstant GL_CURRENT_SECONDARY_COLOR
syntax keyword glConstant GL_SECONDARY_COLOR_ARRAY_SIZE
syntax keyword glConstant GL_SECONDARY_COLOR_ARRAY_TYPE
syntax keyword glConstant GL_SECONDARY_COLOR_ARRAY_STRIDE
syntax keyword glConstant GL_SECONDARY_COLOR_ARRAY_POINTER
syntax keyword glConstant GL_SECONDARY_COLOR_ARRAY
syntax keyword glConstant GL_BLEND_DST_RGB
syntax keyword glConstant GL_BLEND_SRC_RGB
syntax keyword glConstant GL_BLEND_DST_ALPHA
syntax keyword glConstant GL_BLEND_SRC_ALPHA
syntax keyword glConstant GL_INCR_WRAP
syntax keyword glConstant GL_DECR_WRAP
syntax keyword glConstant GL_TEXTURE_FILTER_CONTROL
syntax keyword glConstant GL_TEXTURE_LOD_BIAS
syntax keyword glConstant GL_MAX_TEXTURE_LOD_BIAS
syntax keyword glConstant GL_MIRRORED_REPEAT
"}}}

" }}}  

" Extensions {{{

  if !exists ("c_opengl_no_ext_arb")
  " ARB extensions {{{
    
    " GL_ARB_multitexture (ARB extension and OpenGL 1.2.1) {{{
    syntax keyword glConstant GL_TEXTURE0_ARB         
    syntax keyword glConstant GL_TEXTURE1_ARB         
    syntax keyword glConstant GL_TEXTURE2_ARB         
    syntax keyword glConstant GL_TEXTURE3_ARB         
    syntax keyword glConstant GL_TEXTURE4_ARB         
    syntax keyword glConstant GL_TEXTURE5_ARB         
    syntax keyword glConstant GL_TEXTURE6_ARB         
    syntax keyword glConstant GL_TEXTURE7_ARB         
    syntax keyword glConstant GL_TEXTURE8_ARB         
    syntax keyword glConstant GL_TEXTURE9_ARB         
    syntax keyword glConstant GL_TEXTURE10_ARB        
    syntax keyword glConstant GL_TEXTURE11_ARB        
    syntax keyword glConstant GL_TEXTURE12_ARB        
    syntax keyword glConstant GL_TEXTURE13_ARB        
    syntax keyword glConstant GL_TEXTURE14_ARB        
    syntax keyword glConstant GL_TEXTURE15_ARB        
    syntax keyword glConstant GL_TEXTURE16_ARB        
    syntax keyword glConstant GL_TEXTURE17_ARB        
    syntax keyword glConstant GL_TEXTURE18_ARB        
    syntax keyword glConstant GL_TEXTURE19_ARB        
    syntax keyword glConstant GL_TEXTURE20_ARB        
    syntax keyword glConstant GL_TEXTURE21_ARB        
    syntax keyword glConstant GL_TEXTURE22_ARB        
    syntax keyword glConstant GL_TEXTURE23_ARB        
    syntax keyword glConstant GL_TEXTURE24_ARB        
    syntax keyword glConstant GL_TEXTURE25_ARB        
    syntax keyword glConstant GL_TEXTURE26_ARB        
    syntax keyword glConstant GL_TEXTURE27_ARB        
    syntax keyword glConstant GL_TEXTURE28_ARB        
    syntax keyword glConstant GL_TEXTURE29_ARB        
    syntax keyword glConstant GL_TEXTURE30_ARB        
    syntax keyword glConstant GL_TEXTURE31_ARB        
    syntax keyword glConstant GL_ACTIVE_TEXTURE_ARB       
    syntax keyword glConstant GL_CLIENT_ACTIVE_TEXTURE_ARB
    syntax keyword glConstant GL_MAX_TEXTURE_UNITS_ARB    

    syntax keyword glFunction glActiveTextureARB
    syntax keyword glFunction glClientActiveTextureARB
    syntax keyword glFunction glMultiTexCoord1dARB
    syntax keyword glFunction glMultiTexCoord1dvARB
    syntax keyword glFunction glMultiTexCoord1fARB
    syntax keyword glFunction glMultiTexCoord1fvARB
    syntax keyword glFunction glMultiTexCoord1iARB
    syntax keyword glFunction glMultiTexCoord1ivARB
    syntax keyword glFunction glMultiTexCoord1sARB
    syntax keyword glFunction glMultiTexCoord1svARB
    syntax keyword glFunction glMultiTexCoord2dARB
    syntax keyword glFunction glMultiTexCoord2dvARB
    syntax keyword glFunction glMultiTexCoord2fARB
    syntax keyword glFunction glMultiTexCoord2fvARB
    syntax keyword glFunction glMultiTexCoord2iARB
    syntax keyword glFunction glMultiTexCoord2ivARB
    syntax keyword glFunction glMultiTexCoord2sARB
    syntax keyword glFunction glMultiTexCoord2svARB
    syntax keyword glFunction glMultiTexCoord3dARB
    syntax keyword glFunction glMultiTexCoord3dvARB
    syntax keyword glFunction glMultiTexCoord3fARB
    syntax keyword glFunction glMultiTexCoord3fvARB
    syntax keyword glFunction glMultiTexCoord3iARB
    syntax keyword glFunction glMultiTexCoord3ivARB
    syntax keyword glFunction glMultiTexCoord3sARB
    syntax keyword glFunction glMultiTexCoord3svARB
    syntax keyword glFunction glMultiTexCoord4dARB
    syntax keyword glFunction glMultiTexCoord4dvARB
    syntax keyword glFunction glMultiTexCoord4fARB
    syntax keyword glFunction glMultiTexCoord4fvARB
    syntax keyword glFunction glMultiTexCoord4iARB
    syntax keyword glFunction glMultiTexCoord4ivARB
    syntax keyword glFunction glMultiTexCoord4sARB
    syntax keyword glFunction glMultiTexCoord4svARB
    syntax keyword glFunction glBlendColorEXT
    syntax keyword glFunction glPolygonOffsetEXT
    syntax keyword glFunction glTexImage3DEXT
    syntax keyword glFunction glTexSubImage3DEXT
    syntax keyword glFunction glCopyTexSubImage3DEXT
    syntax keyword glFunction glGenTexturesEXT
    syntax keyword glFunction glDeleteTexturesEXT
    syntax keyword glFunction glBindTextureEXT
    syntax keyword glFunction glPrioritizeTexturesEXT
    syntax keyword glFunction glAreTexturesResidentEXT
    syntax keyword glFunction glIsTextureEXT
    syntax keyword glFunction glVertexPointerEXT
    syntax keyword glFunction glNormalPointerEXT
    syntax keyword glFunction glColorPointerEXT
    syntax keyword glFunction glIndexPointerEXT
    syntax keyword glFunction glTexCoordPointerEXT
    syntax keyword glFunction glEdgeFlagPointerEXT
    syntax keyword glFunction glGetPointervEXT
    syntax keyword glFunction glArrayElementEXT
    syntax keyword glFunction glDrawArraysEXT
    syntax keyword glFunction glBlendEquationEXT
    syntax keyword glFunction glPointParameterfEXT
    syntax keyword glFunction glPointParameterfvEXT
    syntax keyword glFunction glPointParameterfSGIS
    syntax keyword glFunction glPointParameterfvSGIS
    syntax keyword glFunction glColorTableEXT
    syntax keyword glFunction glColorSubTableEXT
    syntax keyword glFunction glGetColorTableEXT
    syntax keyword glFunction glGetColorTableParameterfvEXT
    syntax keyword glFunction glGetColorTableParameterivEXT
    syntax keyword glFunction glLockArraysEXT
    syntax keyword glFunction glUnlockArraysEXT
    syntax keyword glFunction glWindowPos2iMESA
    syntax keyword glFunction glWindowPos2sMESA
    syntax keyword glFunction glWindowPos2fMESA
    syntax keyword glFunction glWindowPos2dMESA
    syntax keyword glFunction glWindowPos2ivMESA
    syntax keyword glFunction glWindowPos2svMESA
    syntax keyword glFunction glWindowPos2fvMESA
    syntax keyword glFunction glWindowPos2dvMESA
    syntax keyword glFunction glWindowPos3iMESA
    syntax keyword glFunction glWindowPos3sMESA
    syntax keyword glFunction glWindowPos3fMESA
    syntax keyword glFunction glWindowPos3dMESA
    syntax keyword glFunction glWindowPos3ivMESA
    syntax keyword glFunction glWindowPos3svMESA
    syntax keyword glFunction glWindowPos3fvMESA
    syntax keyword glFunction glWindowPos3dvMESA
    syntax keyword glFunction glWindowPos4iMESA
    syntax keyword glFunction glWindowPos4sMESA
    syntax keyword glFunction glWindowPos4fMESA
    syntax keyword glFunction glWindowPos4dMESA
    syntax keyword glFunction glWindowPos4ivMESA
    syntax keyword glFunction glWindowPos4svMESA
    syntax keyword glFunction glWindowPos4fvMESA
    syntax keyword glFunction glWindowPos4dvMESA
    syntax keyword glFunction glResizeBuffersMESA
    syntax keyword glFunction glEnableTraceMESA
    syntax keyword glFunction glDisableTraceMESA
    syntax keyword glFunction glNewTraceMESA
    syntax keyword glFunction glEndTraceMESA
    syntax keyword glFunction glTraceAssertAttribMESA
    syntax keyword glFunction glTraceCommentMESA
    syntax keyword glFunction glTraceTextureMESA
    syntax keyword glFunction glTraceListMESA
    syntax keyword glFunction glTracePointerMESA
    syntax keyword glFunction glTracePointerRangeMESA
    " }}}

    " Functions from GL_ARB_VERTEX_PROGRAM {{{
    syntax keyword glFunction glVertexAttrib1sARB
    syntax keyword glFunction glVertexAttrib1fARB
    syntax keyword glFunction glVertexAttrib1dARB
    syntax keyword glFunction glVertexAttrib2sARB
    syntax keyword glFunction glVertexAttrib2fARB
    syntax keyword glFunction glVertexAttrib2dARB
    syntax keyword glFunction glVertexAttrib3sARB
    syntax keyword glFunction glVertexAttrib3fARB
    syntax keyword glFunction glVertexAttrib3dARB
    syntax keyword glFunction glVertexAttrib4sARB
    syntax keyword glFunction glVertexAttrib4fARB
    syntax keyword glFunction glVertexAttrib4dARB
    syntax keyword glFunction glVertexAttrib4NubARB
    syntax keyword glFunction glVertexAttrib1svARB
    syntax keyword glFunction glVertexAttrib1fvARB
    syntax keyword glFunction glVertexAttrib1dvARB
    syntax keyword glFunction glVertexAttrib2svARB
    syntax keyword glFunction glVertexAttrib2fvARB
    syntax keyword glFunction glVertexAttrib2dvARB
    syntax keyword glFunction glVertexAttrib3svARB
    syntax keyword glFunction glVertexAttrib3fvARB
    syntax keyword glFunction glVertexAttrib3dvARB
    syntax keyword glFunction glVertexAttrib4bvARB
    syntax keyword glFunction glVertexAttrib4svARB
    syntax keyword glFunction glVertexAttrib4ivARB
    syntax keyword glFunction glVertexAttrib4ubvARB
    syntax keyword glFunction glVertexAttrib4usvARB
    syntax keyword glFunction glVertexAttrib4uivARB
    syntax keyword glFunction glVertexAttrib4fvARB
    syntax keyword glFunction glVertexAttrib4dvARB
    syntax keyword glFunction glVertexAttrib4NbvARB
    syntax keyword glFunction glVertexAttrib4NsvARB
    syntax keyword glFunction glVertexAttrib4NivARB
    syntax keyword glFunction glVertexAttrib4NubvARB
    syntax keyword glFunction glVertexAttrib4NusvARB
    syntax keyword glFunction glVertexAttrib4NuivARB
    syntax keyword glFunction glVertexAttribPointerARB
    syntax keyword glFunction glEnableVertexAttribArrayARB
    syntax keyword glFunction glDisableVertexAttribArrayARB
    syntax keyword glFunction glProgramStringARB
    syntax keyword glFunction glBindProgramARB
    syntax keyword glFunction glDeleteProgramsARB
    syntax keyword glFunction glGenProgramsARB
    syntax keyword glFunction glProgramEnvParameter4fARB
    syntax keyword glFunction glProgramEnvParameter4dARB
    syntax keyword glFunction glProgramEnvParameter4fvARB
    syntax keyword glFunction glProgramEnvParameter4dvARB
    syntax keyword glFunction glProgramLocalParameter4fARB
    syntax keyword glFunction glProgramLocalParameter4dARB
    syntax keyword glFunction glProgramLocalParameter4fvARB
    syntax keyword glFunction glProgramLocalParameter4dvARB
    syntax keyword glFunction glGetProgramEnvParameterfvARB
    syntax keyword glFunction glGetProgramEnvParameterdvARB
    syntax keyword glFunction glGetProgramLocalParameterfvARB
    syntax keyword glFunction glGetProgramLocalParameterdvARB
    syntax keyword glFunction glGetProgramivARB
    syntax keyword glFunction glGetProgramStringARB
    syntax keyword glFunction glGetVertexAttribdvARB
    syntax keyword glFunction glGetVertexAttribfvARB
    syntax keyword glFunction glGetVertexAttribivARB
    syntax keyword glFunction glGetVertexAttribPointervARB
    syntax keyword glFunction glIsProgramARB
    " }}}

    " other functions (openGL 1.4 and ARB extensions) {{{
    syntax keyword glFunction glLoadTransposeMatrixfARB
    syntax keyword glFunction glLoadTransposeMatrixdARB
    syntax keyword glFunction glMultTransposeMatrixfARB
    syntax keyword glFunction glMultTransposeMatrixdARB
    syntax keyword glFunction glCompressedTexImage3DARB
    syntax keyword glFunction glCompressedTexImage2DARB
    syntax keyword glFunction glCompressedTexImage1DARB
    syntax keyword glFunction glCompressedTexSubImage3DARB
    syntax keyword glFunction glCompressedTexSubImage2DARB
    syntax keyword glFunction glCompressedTexSubImage1DARB
    syntax keyword glFunction glGetCompressedTexImageARB
    syntax keyword glFunction glWeightbvARB
    syntax keyword glFunction glWeightsvARB
    syntax keyword glFunction glWeightivARB
    syntax keyword glFunction glWeightfvARB
    syntax keyword glFunction glWeightdvARB
    syntax keyword glFunction glWeightubvARB
    syntax keyword glFunction glWeightusvARB
    syntax keyword glFunction glWeightuivARB
    syntax keyword glFunction glWeightPointerARB
    syntax keyword glFunction glVertexBlendARB
    syntax keyword glFunction glWindowPos2dARB
    syntax keyword glFunction glWindowPos2fARB
    syntax keyword glFunction glWindowPos2iARB
    syntax keyword glFunction glWindowPos2sARB
    syntax keyword glFunction glWindowPos2ivARB
    syntax keyword glFunction glWindowPos2svARB
    syntax keyword glFunction glWindowPos2fvARB
    syntax keyword glFunction glWindowPos2dvARB
    syntax keyword glFunction glWindowPos3iARB
    syntax keyword glFunction glWindowPos3sARB
    syntax keyword glFunction glWindowPos3fARB
    syntax keyword glFunction glWindowPos3dARB
    syntax keyword glFunction glWindowPos3ivARB
    syntax keyword glFunction glWindowPos3svARB
    syntax keyword glFunction glWindowPos3fvARB
    syntax keyword glFunction glWindowPos3dvARB
    syntax keyword glFunction glBindBufferARB
    syntax keyword glFunction glDeleteBuffersARB
    syntax keyword glFunction glGenBuffersARB
    syntax keyword glFunction glIsBufferARB
    syntax keyword glFunction glBufferDataARB
    syntax keyword glFunction glBufferSubDataARB
    syntax keyword glFunction glGetBufferSubDataARB
    syntax keyword glFunction glMapBufferARB
    syntax keyword glFunction glUnmapBufferARB
    syntax keyword glFunction glGetBufferParameterivARB
    syntax keyword glFunction glGetBufferPointervARB
    syntax keyword glFunction glCurrentPaletteMatrixARB
    syntax keyword glFunction glMatrixIndexubvARB
    syntax keyword glFunction glMatrixIndexusvARB
    syntax keyword glFunction glMatrixIndexuivARB
    syntax keyword glFunction glMatrixIndexPointerARB
    syntax keyword glFunction glSampleCoverageARB
    syntax keyword glFunction glGenQueriesARB
    syntax keyword glFunction glDeleteQueriesARB
    syntax keyword glFunction glIsQueryARB
    syntax keyword glFunction glBeginQueryARB
    syntax keyword glFunction glEndQueryARB
    syntax keyword glFunction glGetQueryivARB
    syntax keyword glFunction glGetQueryObjectivARB
    syntax keyword glFunction glGetQueryObjectuivARB
    " }}}
  
    " GL_ARB_vertex_buffer_object {{{
    syntax keyword glConstant GL_ARRAY_BUFFER_ARB
    syntax keyword glConstant GL_ELEMENT_ARRAY_BUFFER_ARB
    syntax keyword glConstant GL_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_VERTEX_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_NORMAL_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_COLOR_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_INDEX_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB
    syntax keyword glConstant GL_STREAM_DRAW_ARB
    syntax keyword glConstant GL_STREAM_READ_ARB
    syntax keyword glConstant GL_STREAM_COPY_ARB
    syntax keyword glConstant GL_STATIC_DRAW_ARB
    syntax keyword glConstant GL_STATIC_READ_ARB
    syntax keyword glConstant GL_STATIC_COPY_ARB
    syntax keyword glConstant GL_DYNAMIC_DRAW_ARB
    syntax keyword glConstant GL_DYNAMIC_READ_ARB
    syntax keyword glConstant GL_DYNAMIC_COPY_ARB
    syntax keyword glConstant GL_READ_ONLY_ARB
    syntax keyword glConstant GL_WRITE_ONLY_ARB
    syntax keyword glConstant GL_READ_WRITE_ARB
    syntax keyword glConstant GL_BUFFER_SIZE_ARB
    syntax keyword glConstant GL_BUFFER_USAGE_ARB
    syntax keyword glConstant GL_BUFFER_ACCESS_ARB
    syntax keyword glConstant GL_BUFFER_MAPPED_ARB
    syntax keyword glConstant GL_BUFFER_MAP_POINTER_ARB
    "}}}

    " GL_ARB_matrix_palette {{{
    syntax keyword glConstant GL_MATRIX_PALETTE_ARB
    syntax keyword glConstant GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB
    syntax keyword glConstant GL_MAX_PALETTE_MATRICES_ARB
    syntax keyword glConstant GL_CURRENT_PALETTE_MATRIX_ARB
    syntax keyword glConstant GL_MATRIX_INDEX_ARRAY_ARB
    syntax keyword glConstant GL_CURRENT_MATRIX_INDEX_ARB
    syntax keyword glConstant GL_MATRIX_INDEX_ARRAY_SIZE_ARB
    syntax keyword glConstant GL_MATRIX_INDEX_ARRAY_TYPE_ARB
    syntax keyword glConstant GL_MATRIX_INDEX_ARRAY_STRIDE_ARB
    syntax keyword glConstant GL_MATRIX_INDEX_ARRAY_POINTER_ARB
    " }}}

    " GL_ARB_multisample {{{
    syntax keyword glConstant GL_MULTISAMPLE_ARB
    syntax keyword glConstant GL_SAMPLE_ALPHA_TO_COVERAGE_ARB
    syntax keyword glConstant GL_SAMPLE_ALPHA_TO_ONE_ARB
    syntax keyword glConstant GL_SAMPLE_COVERAGE_ARB
    syntax keyword glConstant GL_SAMPLE_BUFFERS_ARB
    syntax keyword glConstant GL_SAMPLES_ARB
    syntax keyword glConstant GL_SAMPLE_COVERAGE_VALUE_ARB
    syntax keyword glConstant GL_SAMPLE_COVERAGE_INVERT_ARB
    syntax keyword glConstant GL_MULTISAMPLE_BIT_ARB
    " }}}

    " GL_ARB_occlusion_query {{{
    syntax keyword glConstant GL_SAMPLES_PASSED_ARB
    syntax keyword glConstant GL_QUERY_COUNTER_BITS_ARB
    syntax keyword glConstant GL_CURRENT_QUERY_ARB
    syntax keyword glConstant GL_QUERY_RESULT_ARB
    syntax keyword glConstant GL_QUERY_RESULT_AVAILABLE_ARB
    " }}}

    " GL_ARB_texture_border_clamp {{{
    syntax keyword glConstant GL_CLAMP_TO_BORDER_ARB
    " }}}

    " GL_ARB_texture_compression {{{
    syntax keyword glConstant GL_COMPRESSED_ALPHA_ARB
    syntax keyword glConstant GL_COMPRESSED_LUMINANCE_ARB
    syntax keyword glConstant GL_COMPRESSED_LUMINANCE_ALPHA_ARB
    syntax keyword glConstant GL_COMPRESSED_INTENSITY_ARB
    syntax keyword glConstant GL_COMPRESSED_RGB_ARB
    syntax keyword glConstant GL_COMPRESSED_RGBA_ARB
    syntax keyword glConstant GL_TEXTURE_COMPRESSION_HINT_ARB
    syntax keyword glConstant GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB
    syntax keyword glConstant GL_TEXTURE_COMPRESSED_ARB
    syntax keyword glConstant GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB
    syntax keyword glConstant GL_COMPRESSED_TEXTURE_FORMATS_ARB
    " }}}

    " GL_ARB_texture_cube_map {{{
    syntax keyword glConstant GL_NORMAL_MAP_ARB
    syntax keyword glConstant GL_REFLECTION_MAP_ARB
    syntax keyword glConstant GL_TEXTURE_CUBE_MAP_ARB
    syntax keyword glConstant GL_TEXTURE_BINDING_CUBE_MAP_ARB
    syntax keyword glConstant GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB
    syntax keyword glConstant GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB
    syntax keyword glConstant GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB
    syntax keyword glConstant GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB
    syntax keyword glConstant GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB
    syntax keyword glConstant GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB
    syntax keyword glConstant GL_PROXY_TEXTURE_CUBE_MAP_ARB
    syntax keyword glConstant GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB
    " }}}
    
    " GL_ARB_texture_env_combine {{{
    syntax keyword glConstant GL_COMBINE_ARB
    syntax keyword glConstant GL_COMBINE_RGB_ARB
    syntax keyword glConstant GL_COMBINE_ALPHA_ARB
    syntax keyword glConstant GL_SOURCE0_RGB_ARB
    syntax keyword glConstant GL_SOURCE1_RGB_ARB
    syntax keyword glConstant GL_SOURCE2_RGB_ARB
    syntax keyword glConstant GL_SOURCE0_ALPHA_ARB
    syntax keyword glConstant GL_SOURCE1_ALPHA_ARB
    syntax keyword glConstant GL_SOURCE2_ALPHA_ARB
    syntax keyword glConstant GL_OPERAND0_RGB_ARB
    syntax keyword glConstant GL_OPERAND1_RGB_ARB
    syntax keyword glConstant GL_OPERAND2_RGB_ARB
    syntax keyword glConstant GL_OPERAND0_ALPHA_ARB
    syntax keyword glConstant GL_OPERAND1_ALPHA_ARB
    syntax keyword glConstant GL_OPERAND2_ALPHA_ARB
    syntax keyword glConstant GL_RGB_SCALE_ARB
    syntax keyword glConstant GL_ADD_SIGNED_ARB
    syntax keyword glConstant GL_INTERPOLATE_ARB
    syntax keyword glConstant GL_CONSTANT_ARB
    syntax keyword glConstant GL_PRIMARY_COLOR_ARB
    syntax keyword glConstant GL_PREVIOUS_ARB
    syntax keyword glConstant GL_SUBTRACT_ARB
    " }}}

    " GL_ARB_texture_env_dot3 {{{
    syntax keyword glConstant GL_DOT3_RGB_ARB
    syntax keyword glConstant GL_DOT3_RGBA_ARB
    " }}}

    " GL_ARB_texture_mirrored_repeat {{{
    syntax keyword glConstant GL_MIRRORED_REPEAT_ARB
    " }}}

    " GL_ARB_transpose_matrix {{{
    syntax keyword glConstant GL_TRANSPOSE_MODELVIEW_MATRIX_ARB
    syntax keyword glConstant GL_TRANSPOSE_PROJECTION_MATRIX_ARB
    syntax keyword glConstant GL_TRANSPOSE_TEXTURE_MATRIX_ARB
    syntax keyword glConstant GL_TRANSPOSE_COLOR_MATRIX_ARB
    " }}}

    " GL_ARB_vertex_blend {{{
    syntax keyword glConstant GL_MAX_VERTEX_UNITS_ARB
    syntax keyword glConstant GL_ACTIVE_VERTEX_UNITS_ARB
    syntax keyword glConstant GL_WEIGHT_SUM_UNITY_ARB
    syntax keyword glConstant GL_VERTEX_BLEND_ARB
    syntax keyword glConstant GL_CURRENT_WEIGHT_ARB
    syntax keyword glConstant GL_WEIGHT_ARRAY_TYPE_ARB
    syntax keyword glConstant GL_WEIGHT_ARRAY_STRIDE_ARB
    syntax keyword glConstant GL_WEIGHT_ARRAY_SIZE_ARB
    syntax keyword glConstant GL_WEIGHT_ARRAY_POINTER_ARB
    syntax keyword glConstant GL_WEIGHT_ARRAY_ARB
    syntax keyword glConstant GL_MODELVIEW0_ARB
    syntax keyword glConstant GL_MODELVIEW1_ARB
    syntax keyword glConstant GL_MODELVIEW2_ARB
    syntax keyword glConstant GL_MODELVIEW3_ARB
    syntax keyword glConstant GL_MODELVIEW4_ARB
    syntax keyword glConstant GL_MODELVIEW5_ARB
    syntax keyword glConstant GL_MODELVIEW6_ARB
    syntax keyword glConstant GL_MODELVIEW7_ARB
    syntax keyword glConstant GL_MODELVIEW8_ARB
    syntax keyword glConstant GL_MODELVIEW9_ARB
    syntax keyword glConstant GL_MODELVIEW10_ARB
    syntax keyword glConstant GL_MODELVIEW11_ARB
    syntax keyword glConstant GL_MODELVIEW12_ARB
    syntax keyword glConstant GL_MODELVIEW13_ARB
    syntax keyword glConstant GL_MODELVIEW14_ARB
    syntax keyword glConstant GL_MODELVIEW15_ARB
    syntax keyword glConstant GL_MODELVIEW16_ARB
    syntax keyword glConstant GL_MODELVIEW17_ARB
    syntax keyword glConstant GL_MODELVIEW18_ARB
    syntax keyword glConstant GL_MODELVIEW19_ARB
    syntax keyword glConstant GL_MODELVIEW20_ARB
    syntax keyword glConstant GL_MODELVIEW21_ARB
    syntax keyword glConstant GL_MODELVIEW22_ARB
    syntax keyword glConstant GL_MODELVIEW23_ARB
    syntax keyword glConstant GL_MODELVIEW24_ARB
    syntax keyword glConstant GL_MODELVIEW25_ARB
    syntax keyword glConstant GL_MODELVIEW26_ARB
    syntax keyword glConstant GL_MODELVIEW27_ARB
    syntax keyword glConstant GL_MODELVIEW28_ARB
    syntax keyword glConstant GL_MODELVIEW29_ARB
    syntax keyword glConstant GL_MODELVIEW30_ARB
    syntax keyword glConstant GL_MODELVIEW31_ARB
    " }}}

    " GL_ARB_vertex_program {{{
    syntax keyword glConstant GL_VERTEX_PROGRAM_ARB
    syntax keyword glConstant GL_VERTEX_PROGRAM_POINT_SIZE_ARB
    syntax keyword glConstant GL_VERTEX_PROGRAM_TWO_SIDE_ARB
    syntax keyword glConstant GL_COLOR_SUM_ARB
    syntax keyword glConstant GL_PROGRAM_FORMAT_ASCII_ARB
    syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB
    syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB
    syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB
    syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB
    syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB
    syntax keyword glConstant GL_CURRENT_VERTEX_ATTRIB_ARB
    syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB
    syntax keyword glConstant GL_PROGRAM_LENGTH_ARB
    syntax keyword glConstant GL_PROGRAM_FORMAT_ARB
    syntax keyword glConstant GL_PROGRAM_BINDING_ARB
    syntax keyword glConstant GL_PROGRAM_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_PROGRAM_TEMPORARIES_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_TEMPORARIES_ARB
    syntax keyword glConstant GL_PROGRAM_NATIVE_TEMPORARIES_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB
    syntax keyword glConstant GL_PROGRAM_PARAMETERS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_PARAMETERS_ARB
    syntax keyword glConstant GL_PROGRAM_NATIVE_PARAMETERS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB
    syntax keyword glConstant GL_PROGRAM_ATTRIBS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_ATTRIBS_ARB
    syntax keyword glConstant GL_PROGRAM_NATIVE_ATTRIBS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB
    syntax keyword glConstant GL_PROGRAM_ADDRESS_REGISTERS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB
    syntax keyword glConstant GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_ENV_PARAMETERS_ARB
    syntax keyword glConstant GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB
    syntax keyword glConstant GL_PROGRAM_STRING_ARB
    syntax keyword glConstant GL_PROGRAM_ERROR_POSITION_ARB
    syntax keyword glConstant GL_CURRENT_MATRIX_ARB
    syntax keyword glConstant GL_TRANSPOSE_CURRENT_MATRIX_ARB
    syntax keyword glConstant GL_CURRENT_MATRIX_STACK_DEPTH_ARB
    syntax keyword glConstant GL_MAX_VERTEX_ATTRIBS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_MATRICES_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB
    syntax keyword glConstant GL_PROGRAM_ERROR_STRING_ARB
    syntax keyword glConstant GL_MATRIX0_ARB
    syntax keyword glConstant GL_MATRIX1_ARB
    syntax keyword glConstant GL_MATRIX2_ARB
    syntax keyword glConstant GL_MATRIX3_ARB
    syntax keyword glConstant GL_MATRIX4_ARB
    syntax keyword glConstant GL_MATRIX5_ARB
    syntax keyword glConstant GL_MATRIX6_ARB
    syntax keyword glConstant GL_MATRIX7_ARB
    syntax keyword glConstant GL_MATRIX8_ARB
    syntax keyword glConstant GL_MATRIX9_ARB
    syntax keyword glConstant GL_MATRIX10_ARB
    syntax keyword glConstant GL_MATRIX11_ARB
    syntax keyword glConstant GL_MATRIX12_ARB
    syntax keyword glConstant GL_MATRIX13_ARB
    syntax keyword glConstant GL_MATRIX14_ARB
    syntax keyword glConstant GL_MATRIX15_ARB
    syntax keyword glConstant GL_MATRIX16_ARB
    syntax keyword glConstant GL_MATRIX17_ARB
    syntax keyword glConstant GL_MATRIX18_ARB
    syntax keyword glConstant GL_MATRIX19_ARB
    syntax keyword glConstant GL_MATRIX20_ARB
    syntax keyword glConstant GL_MATRIX21_ARB
    syntax keyword glConstant GL_MATRIX22_ARB
    syntax keyword glConstant GL_MATRIX23_ARB
    syntax keyword glConstant GL_MATRIX24_ARB
    syntax keyword glConstant GL_MATRIX25_ARB
    syntax keyword glConstant GL_MATRIX26_ARB
    syntax keyword glConstant GL_MATRIX27_ARB
    syntax keyword glConstant GL_MATRIX28_ARB
    syntax keyword glConstant GL_MATRIX29_ARB
    syntax keyword glConstant GL_MATRIX30_ARB
    syntax keyword glConstant GL_MATRIX31_ARB
    " }}}

    " GL_ARB_depth_texture {{{
    syntax keyword glConstant GL_DEPTH_COMPONENT16_ARB
    syntax keyword glConstant GL_DEPTH_COMPONENT24_ARB
    syntax keyword glConstant GL_DEPTH_COMPONENT32_ARB
    syntax keyword glConstant GL_TEXTURE_DEPTH_SIZE_ARB
    syntax keyword glConstant GL_DEPTH_TEXTURE_MODE_ARB
    " }}}

    " GL_ARB_shadow {{{
    syntax keyword glConstant GL_TEXTURE_COMPARE_MODE_ARB
    syntax keyword glConstant GL_TEXTURE_COMPARE_FUNC_ARB
    syntax keyword glConstant GL_COMPARE_R_TO_TEXTURE_ARB
    " }}}

    " GL_ARB_shadow_ambient {{{
    syntax keyword glConstant GL_TEXTURE_COMPARE_FAIL_VALUE_ARB
    " }}}

    " GL_ARB_point_parameters {{{
    syntax keyword glConstant GL_POINT_SIZE_MIN_ARB
    syntax keyword glConstant GL_POINT_SIZE_MAX_ARB
    syntax keyword glConstant GL_POINT_FADE_THRESHOLD_SIZE_ARB
    syntax keyword glConstant GL_POINT_DISTANCE_ATTENUATION_ARB
    " }}}

    " GL_ARB_fragment_program {{{
    syntax keyword glConstant GL_FRAGMENT_PROGRAM_ARB
    syntax keyword glConstant GL_PROGRAM_ALU_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_PROGRAM_TEX_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_PROGRAM_TEX_INDIRECTIONS_ARB
    syntax keyword glConstant GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB
    syntax keyword glConstant GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB
    syntax keyword glConstant GL_MAX_TEXTURE_COORDS_ARB
    syntax keyword glConstant GL_MAX_TEXTURE_IMAGE_UNITS_ARB
    " }}}

    " OpenGL ARB extension GL_ARB_shader_objects {{{
    syntax keyword glConstant GL_OBJECT_TYPE_ARB
    syntax keyword glConstant GL_OBJECT_SUBTYPE_ARB
    syntax keyword glConstant GL_OBJECT_DELETE_STATUS_ARB
    syntax keyword glConstant GL_OBJECT_COMPILE_STATUS_ARB
    syntax keyword glConstant GL_OBJECT_LINK_STATUS_ARB
    syntax keyword glConstant GL_OBJECT_VALIDATE_STATUS_ARB
    syntax keyword glConstant GL_OBJECT_INFO_LOG_LENGTH_ARB
    syntax keyword glConstant GL_OBJECT_ATTACHED_OBJECTS_ARB
    syntax keyword glConstant GL_OBJECT_ACTIVE_UNIFORMS_ARB
    syntax keyword glConstant GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB
    syntax keyword glConstant GL_OBJECT_SHADER_SOURCE_LENGTH_ARB

    syntax keyword glType GL_PROGRAM_OBJECT_ARB
    syntax keyword glType GL_SHADER_OBJECT_ARB
    syntax keyword glType GL_FLOAT_VEC2_ARB
    syntax keyword glType GL_FLOAT_VEC3_ARB
    syntax keyword glType GL_FLOAT_VEC4_ARB
    syntax keyword glType GL_INT_VEC2_ARB
    syntax keyword glType GL_INT_VEC3_ARB
    syntax keyword glType GL_INT_VEC4_ARB
    syntax keyword glType GL_BOOL_ARB
    syntax keyword glType GL_BOOL_VEC2_ARB
    syntax keyword glType GL_BOOL_VEC3_ARB
    syntax keyword glType GL_BOOL_VEC4_ARB
    syntax keyword glType GL_FLOAT_MAT2_ARB
    syntax keyword glType GL_FLOAT_MAT3_ARB
    syntax keyword glType GL_FLOAT_MAT4_ARB
    syntax keyword glType GLcharARB
    syntax keyword glType GLhandleARB

    syntax keyword glFunction glDeleteObjectARB
    syntax keyword glFunction glGetHandleARB
    syntax keyword glFunction glDetachObjectARB
    syntax keyword glFunction glCreateShaderObjectARB
    syntax keyword glFunction glShaderSourceARB
    syntax keyword glFunction glCompileShaderARB
    syntax keyword glFunction glCreateProgramObjectARB
    syntax keyword glFunction glAttachObjectARB
    syntax keyword glFunction glLinkProgramARB
    syntax keyword glFunction glUseProgramObjectARB
    syntax keyword glFunction glValidateProgramARB
    syntax keyword glFunction glUniform1fARB
    syntax keyword glFunction glUniform2fARB
    syntax keyword glFunction glUniform3fARB
    syntax keyword glFunction glUniform4fARB
    syntax keyword glFunction glUniform1iARB
    syntax keyword glFunction glUniform2iARB
    syntax keyword glFunction glUniform3iARB
    syntax keyword glFunction glUniform4iARB
    syntax keyword glFunction glUniform1fvARB
    syntax keyword glFunction glUniform2fvARB
    syntax keyword glFunction glUniform3fvARB
    syntax keyword glFunction glUniform4fvARB
    syntax keyword glFunction glUniform1ivARB
    syntax keyword glFunction glUniform2ivARB
    syntax keyword glFunction glUniform3ivARB
    syntax keyword glFunction glUniform4ivARB
    syntax keyword glFunction glUniformMatrix2fvARB
    syntax keyword glFunction glUniformMatrix3fvARB
    syntax keyword glFunction glUniformMatrix4fvARB
    syntax keyword glFunction glGetObjectParameterfvARB
    syntax keyword glFunction glGetObjectParameterivARB
    syntax keyword glFunction glGetInfoLogARB
    syntax keyword glFunction glGetAttachedObjectsARB
    syntax keyword glFunction glGetUniformLocationARB
    syntax keyword glFunction glGetActiveUniformARB
    syntax keyword glFunction glGetUniformfvARB
    syntax keyword glFunction glGetUniformivARB
    syntax keyword glFunction glGetShaderSourceARB
    " }}}

    " OpenGL ARB extension GL_ARB_vertex_shader {{{
    syntax keyword glConstant GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB
    syntax keyword glConstant GL_MAX_VARYING_FLOATS_ARB
    syntax keyword glConstant GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB
    syntax keyword glConstant GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB
    syntax keyword glConstant GL_OBJECT_ACTIVE_ATTRIBUTES_ARB
    syntax keyword glConstant GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB
    syntax keyword glType GL_VERTEX_SHADER_ARB
    syntax keyword glFunction glBindAttribLocationARB
    syntax keyword glFunction glGetActiveAttribARB
    syntax keyword glFunction glGetAttribLocationARB
    " }}}

    " OpenGL ARB extension GL_ARB_fragment_shader {{{ 
    syntax keyword glConstant GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB
    syntax keyword glType GL_FRAGMENT_SHADER_ARB
    " }}}
    
  " }}}
  endif 
 
" }}} 

" Functions {{{ 
syntax keyword glFunction glClearIndex
syntax keyword glFunction glClearColor
syntax keyword glFunction glClear
syntax keyword glFunction glIndexMask
syntax keyword glFunction glColorMask
syntax keyword glFunction glAlphaFunc
syntax keyword glFunction glBlendFunc
syntax keyword glFunction glLogicOp
syntax keyword glFunction glCullFace
syntax keyword glFunction glFrontFace
syntax keyword glFunction glPointSize
syntax keyword glFunction glLineWidth
syntax keyword glFunction glLineStipple
syntax keyword glFunction glPolygonMode
syntax keyword glFunction glPolygonOffset
syntax keyword glFunction glPolygonStipple
syntax keyword glFunction glGetPolygonStipple
syntax keyword glFunction glEdgeFlag
syntax keyword glFunction glEdgeFlagv
syntax keyword glFunction glScissor
syntax keyword glFunction glClipPlane
syntax keyword glFunction glGetClipPlane
syntax keyword glFunction glDrawBuffer
syntax keyword glFunction glReadBuffer
syntax keyword glFunction glEnable
syntax keyword glFunction glDisable
syntax keyword glFunction glIsEnabled
syntax keyword glFunction glEnableClientState
syntax keyword glFunction glDisableClientState
syntax keyword glFunction glGetBooleanv
syntax keyword glFunction glGetDoublev
syntax keyword glFunction glGetFloatv
syntax keyword glFunction glGetIntegerv
syntax keyword glFunction glPushAttrib
syntax keyword glFunction glPopAttrib
syntax keyword glFunction glPushClientAttrib
syntax keyword glFunction glPopClientAttrib
syntax keyword glFunction glRenderMode
syntax keyword glFunction glGetError
syntax keyword glFunction glGetString
syntax keyword glFunction glFinish
syntax keyword glFunction glFlush
syntax keyword glFunction glHint
syntax keyword glFunction glClearDepth
syntax keyword glFunction glDepthFunc
syntax keyword glFunction glDepthMask
syntax keyword glFunction glDepthRange
syntax keyword glFunction glClearAccum
syntax keyword glFunction glAccum
syntax keyword glFunction glMatrixMode
syntax keyword glFunction glOrtho
syntax keyword glFunction glFrustum
syntax keyword glFunction glViewport
syntax keyword glFunction glPushMatrix
syntax keyword glFunction glPopMatrix
syntax keyword glFunction glLoadIdentity
syntax keyword glFunction glLoadMatrixd
syntax keyword glFunction glLoadMatrixf
syntax keyword glFunction glMultMatrixd
syntax keyword glFunction glMultMatrixf
syntax keyword glFunction glRotated
syntax keyword glFunction gle
syntax keyword glFunction glRotatef
syntax keyword glFunction gle
syntax keyword glFunction glScaled
syntax keyword glFunction glScalef
syntax keyword glFunction glTranslated
syntax keyword glFunction glTranslatef
syntax keyword glFunction glIsList
syntax keyword glFunction glDeleteLists
syntax keyword glFunction glGenLists
syntax keyword glFunction glNewList
syntax keyword glFunction glEndList
syntax keyword glFunction glCallList
syntax keyword glFunction glCallLists
syntax keyword glFunction glListBase
syntax keyword glFunction glBegin
syntax keyword glFunction glEnd
syntax keyword glFunction glVertex2d
syntax keyword glFunction glVertex2f
syntax keyword glFunction glVertex2i
syntax keyword glFunction glVertex2s
syntax keyword glFunction glVertex3d
syntax keyword glFunction glVertex3f
syntax keyword glFunction glVertex3i
syntax keyword glFunction glVertex3s
syntax keyword glFunction glVertex4d
syntax keyword glFunction glVertex4f
syntax keyword glFunction glVertex4i
syntax keyword glFunction glVertex4s
syntax keyword glFunction glVertex2dv
syntax keyword glFunction glVertex2fv
syntax keyword glFunction glVertex2iv
syntax keyword glFunction glVertex2sv
syntax keyword glFunction glVertex3dv
syntax keyword glFunction glVertex3fv
syntax keyword glFunction glVertex3iv
syntax keyword glFunction glVertex3sv
syntax keyword glFunction glVertex4dv
syntax keyword glFunction glVertex4fv
syntax keyword glFunction glVertex4iv
syntax keyword glFunction glVertex4sv
syntax keyword glFunction glNormal3b
syntax keyword glFunction glNormal3d
syntax keyword glFunction glNormal3f
syntax keyword glFunction glNormal3i
syntax keyword glFunction glNormal3s
syntax keyword glFunction glNormal3bv
syntax keyword glFunction glNormal3dv
syntax keyword glFunction glNormal3fv
syntax keyword glFunction glNormal3iv
syntax keyword glFunction glNormal3sv
syntax keyword glFunction glIndexd
syntax keyword glFunction glIndexf
syntax keyword glFunction glIndexi
syntax keyword glFunction glIndexs
syntax keyword glFunction glIndexub
syntax keyword glFunction glIndexdv
syntax keyword glFunction glIndexfv
syntax keyword glFunction glIndexiv
syntax keyword glFunction glIndexsv
syntax keyword glFunction glIndexubv
syntax keyword glFunction glColor3b
syntax keyword glFunction glColor3d
syntax keyword glFunction glColor3f
syntax keyword glFunction glColor3i
syntax keyword glFunction glColor3s
syntax keyword glFunction glColor3ub
syntax keyword glFunction glColor3ui
syntax keyword glFunction glColor3us
syntax keyword glFunction glColor4b
syntax keyword glFunction glColor4d
syntax keyword glFunction glColor4f
syntax keyword glFunction glColor4i
syntax keyword glFunction glColor4s
syntax keyword glFunction glColor4ub
syntax keyword glFunction glColor4ui
syntax keyword glFunction glColor4us
syntax keyword glFunction glColor3bv
syntax keyword glFunction glColor3dv
syntax keyword glFunction glColor3fv
syntax keyword glFunction glColor3iv
syntax keyword glFunction glColor3sv
syntax keyword glFunction glColor3ubv
syntax keyword glFunction glColor3uiv
syntax keyword glFunction glColor3usv
syntax keyword glFunction glColor4bv
syntax keyword glFunction glColor4dv
syntax keyword glFunction glColor4fv
syntax keyword glFunction glColor4iv
syntax keyword glFunction glColor4sv
syntax keyword glFunction glColor4ubv
syntax keyword glFunction glColor4uiv
syntax keyword glFunction glColor4usv
syntax keyword glFunction glTexCoord1d
syntax keyword glFunction glTexCoord1f
syntax keyword glFunction glTexCoord1i
syntax keyword glFunction glTexCoord1s
syntax keyword glFunction glTexCoord2d
syntax keyword glFunction glTexCoord2f
syntax keyword glFunction glTexCoord2i
syntax keyword glFunction glTexCoord2s
syntax keyword glFunction glTexCoord3d
syntax keyword glFunction glTexCoord3f
syntax keyword glFunction glTexCoord3i
syntax keyword glFunction glTexCoord3s
syntax keyword glFunction glTexCoord4d
syntax keyword glFunction glTexCoord4f
syntax keyword glFunction glTexCoord4i
syntax keyword glFunction glTexCoord4s
syntax keyword glFunction glTexCoord1dv
syntax keyword glFunction glTexCoord1fv
syntax keyword glFunction glTexCoord1iv
syntax keyword glFunction glTexCoord1sv
syntax keyword glFunction glTexCoord2dv
syntax keyword glFunction glTexCoord2fv
syntax keyword glFunction glTexCoord2iv
syntax keyword glFunction glTexCoord2sv
syntax keyword glFunction glTexCoord3dv
syntax keyword glFunction glTexCoord3fv
syntax keyword glFunction glTexCoord3iv
syntax keyword glFunction glTexCoord3sv
syntax keyword glFunction glTexCoord4dv
syntax keyword glFunction glTexCoord4fv
syntax keyword glFunction glTexCoord4iv
syntax keyword glFunction glTexCoord4sv
syntax keyword glFunction glRasterPos2d
syntax keyword glFunction glRasterPos2f
syntax keyword glFunction glRasterPos2i
syntax keyword glFunction glRasterPos2s
syntax keyword glFunction glRasterPos3d
syntax keyword glFunction glRasterPos3f
syntax keyword glFunction glRasterPos3i
syntax keyword glFunction glRasterPos3s
syntax keyword glFunction glRasterPos4d
syntax keyword glFunction glRasterPos4f
syntax keyword glFunction glRasterPos4i
syntax keyword glFunction glRasterPos4s
syntax keyword glFunction glRasterPos2dv
syntax keyword glFunction glRasterPos2fv
syntax keyword glFunction glRasterPos2iv
syntax keyword glFunction glRasterPos2sv
syntax keyword glFunction glRasterPos3dv
syntax keyword glFunction glRasterPos3fv
syntax keyword glFunction glRasterPos3iv
syntax keyword glFunction glRasterPos3sv
syntax keyword glFunction glRasterPos4dv
syntax keyword glFunction glRasterPos4fv
syntax keyword glFunction glRasterPos4iv
syntax keyword glFunction glRasterPos4sv
syntax keyword glFunction glRectd
syntax keyword glFunction glRectf
syntax keyword glFunction glRecti
syntax keyword glFunction glRects
syntax keyword glFunction glRectdv
syntax keyword glFunction glRectfv
syntax keyword glFunction glRectiv
syntax keyword glFunction glRectsv
syntax keyword glFunction glVertexPointer
syntax keyword glFunction glNormalPointer
syntax keyword glFunction glColorPointer
syntax keyword glFunction glIndexPointer
syntax keyword glFunction glTexCoordPointer
syntax keyword glFunction glEdgeFlagPointer
syntax keyword glFunction glGetPointerv
syntax keyword glFunction glArrayElement
syntax keyword glFunction glDrawArrays
syntax keyword glFunction glDrawElements
syntax keyword glFunction glInterleavedArrays
syntax keyword glFunction glShadeModel
syntax keyword glFunction glLightf
syntax keyword glFunction glLighti
syntax keyword glFunction glLightfv
syntax keyword glFunction glLightiv
syntax keyword glFunction glGetLightfv
syntax keyword glFunction glGetLightiv
syntax keyword glFunction glLightModelf
syntax keyword glFunction glLightModeli
syntax keyword glFunction glLightModelfv
syntax keyword glFunction glLightModeliv
syntax keyword glFunction glMaterialf
syntax keyword glFunction glMateriali
syntax keyword glFunction glMaterialfv
syntax keyword glFunction glMaterialiv
syntax keyword glFunction glGetMaterialfv
syntax keyword glFunction glGetMaterialiv
syntax keyword glFunction glColorMaterial
syntax keyword glFunction glPixelZoom
syntax keyword glFunction glPixelStoref
syntax keyword glFunction glPixelStorei
syntax keyword glFunction glPixelTransferf
syntax keyword glFunction glPixelTransferi
syntax keyword glFunction glPixelMapfv
syntax keyword glFunction glPixelMapuiv
syntax keyword glFunction glPixelMapusv
syntax keyword glFunction glGetPixelMapfv
syntax keyword glFunction glGetPixelMapuiv
syntax keyword glFunction glGetPixelMapusv
syntax keyword glFunction glBitmap
syntax keyword glFunction glReadPixels
syntax keyword glFunction glDrawPixels
syntax keyword glFunction glCopyPixels
syntax keyword glFunction glStencilFunc
syntax keyword glFunction glStencilMask
syntax keyword glFunction glStencilOp
syntax keyword glFunction glClearStencil
syntax keyword glFunction glTexGend
syntax keyword glFunction glTexGenf
syntax keyword glFunction glTexGeni
syntax keyword glFunction glTexGendv
syntax keyword glFunction glTexGenfv
syntax keyword glFunction glTexGeniv
syntax keyword glFunction glGetTexGendv
syntax keyword glFunction glGetTexGenfv
syntax keyword glFunction glGetTexGeniv
syntax keyword glFunction glTexEnvf
syntax keyword glFunction glTexEnvi
syntax keyword glFunction glTexEnvfv
syntax keyword glFunction glTexEnviv
syntax keyword glFunction glGetTexEnvfv
syntax keyword glFunction glGetTexEnviv
syntax keyword glFunction glTexParameterf
syntax keyword glFunction glTexParameteri
syntax keyword glFunction glTexParameterfv
syntax keyword glFunction glTexParameteriv
syntax keyword glFunction glGetTexParameterfv
syntax keyword glFunction glGetTexParameteriv
syntax keyword glFunction glGetTexLevelParameterfv
syntax keyword glFunction glGetTexLevelParameteriv
syntax keyword glFunction glTexImage1D
syntax keyword glFunction glTexImage2D
syntax keyword glFunction glGetTexImage
syntax keyword glFunction glGenTextures
syntax keyword glFunction glDeleteTextures
syntax keyword glFunction glBindTexture
syntax keyword glFunction glPrioritizeTextures
syntax keyword glFunction glAreTexturesResident
syntax keyword glFunction glIsTexture
syntax keyword glFunction glTexSubImage1D
syntax keyword glFunction glTexSubImage2D
syntax keyword glFunction glCopyTexImage1D
syntax keyword glFunction glCopyTexImage2D
syntax keyword glFunction glCopyTexSubImage1D
syntax keyword glFunction glCopyTexSubImage2D
syntax keyword glFunction glMap1d
syntax keyword glFunction glMap1f
syntax keyword glFunction glMap2d
syntax keyword glFunction glMap2f
syntax keyword glFunction glGetMapdv
syntax keyword glFunction glGetMapfv
syntax keyword glFunction glGetMapiv
syntax keyword glFunction glEvalCoord1d
syntax keyword glFunction glEvalCoord1f
syntax keyword glFunction glEvalCoord1dv
syntax keyword glFunction glEvalCoord1fv
syntax keyword glFunction glEvalCoord2d
syntax keyword glFunction glEvalCoord2f
syntax keyword glFunction glEvalCoord2dv
syntax keyword glFunction glEvalCoord2fv
syntax keyword glFunction glMapGrid1d
syntax keyword glFunction glMapGrid1f
syntax keyword glFunction glMapGrid2d
syntax keyword glFunction glMapGrid2f
syntax keyword glFunction glEvalPoint1
syntax keyword glFunction glEvalPoint2
syntax keyword glFunction glEvalMesh1
syntax keyword glFunction glEvalMesh2
syntax keyword glFunction glFogf
syntax keyword glFunction glFogi
syntax keyword glFunction glFogfv
syntax keyword glFunction glFogiv
syntax keyword glFunction glFeedbackBuffer
syntax keyword glFunction glPassThrough
syntax keyword glFunction glSelectBuffer
syntax keyword glFunction glInitNames
syntax keyword glFunction glLoadName
syntax keyword glFunction glPushName
syntax keyword glFunction glPopName
syntax keyword glFunction glDrawRangeElements
syntax keyword glFunction glTexImage3D
syntax keyword glFunction glTexSubImage3D
syntax keyword glFunction glCopyTexSubImage3D
syntax keyword glFunction glColorTable
syntax keyword glFunction glColorSubTable
syntax keyword glFunction glColorTableParameteriv
syntax keyword glFunction glColorTableParameterfv
syntax keyword glFunction glCopyColorSubTable
syntax keyword glFunction glCopyColorTable
syntax keyword glFunction glGetColorTable
syntax keyword glFunction glGetColorTableParameterfv
syntax keyword glFunction glGetColorTableParameteriv
syntax keyword glFunction glBlendEquation
syntax keyword glFunction glBlendColor
syntax keyword glFunction glHistogram
syntax keyword glFunction glResetHistogram
syntax keyword glFunction glGetHistogram
syntax keyword glFunction glGetHistogramParameterfv
syntax keyword glFunction glGetHistogramParameteriv
syntax keyword glFunction glMinmax
syntax keyword glFunction glResetMinmax
syntax keyword glFunction glGetMinmax
syntax keyword glFunction glGetMinmaxParameterfv
syntax keyword glFunction glGetMinmaxParameteriv
syntax keyword glFunction glConvolutionFilter1D
syntax keyword glFunction glConvolutionFilter2D
syntax keyword glFunction glConvolutionParameterf
syntax keyword glFunction glConvolutionParameterfv
syntax keyword glFunction glConvolutionParameteri
syntax keyword glFunction glConvolutionParameteriv
syntax keyword glFunction glCopyConvolutionFilter1D
syntax keyword glFunction glCopyConvolutionFilter2D
syntax keyword glFunction glGetConvolutionFilter
syntax keyword glFunction glGetConvolutionParameterfv
syntax keyword glFunction glGetConvolutionParameteriv
syntax keyword glFunction glSeparableFilter2D
syntax keyword glFunction glGetSeparableFilter
syntax keyword glFunction glActiveTexture
syntax keyword glFunction glClientActiveTexture
syntax keyword glFunction glCompressedTexImage1D
syntax keyword glFunction glCompressedTexImage2D
syntax keyword glFunction glCompressedTexImage3D
syntax keyword glFunction glCompressedTexSubImage1D
syntax keyword glFunction glCompressedTexSubImage2D
syntax keyword glFunction glCompressedTexSubImage3D
syntax keyword glFunction glGetCompressedTexImage
syntax keyword glFunction glMultiTexCoord1d
syntax keyword glFunction glMultiTexCoord1dv
syntax keyword glFunction glMultiTexCoord1f
syntax keyword glFunction glMultiTexCoord1fv
syntax keyword glFunction glMultiTexCoord1i
syntax keyword glFunction glMultiTexCoord1iv
syntax keyword glFunction glMultiTexCoord1s
syntax keyword glFunction glMultiTexCoord1sv
syntax keyword glFunction glMultiTexCoord2d
syntax keyword glFunction glMultiTexCoord2dv
syntax keyword glFunction glMultiTexCoord2f
syntax keyword glFunction glMultiTexCoord2fv
syntax keyword glFunction glMultiTexCoord2i
syntax keyword glFunction glMultiTexCoord2iv
syntax keyword glFunction glMultiTexCoord2s
syntax keyword glFunction glMultiTexCoord2sv
syntax keyword glFunction glMultiTexCoord3d
syntax keyword glFunction glMultiTexCoord3dv
syntax keyword glFunction glMultiTexCoord3f
syntax keyword glFunction glMultiTexCoord3fv
syntax keyword glFunction glMultiTexCoord3i
syntax keyword glFunction glMultiTexCoord3iv
syntax keyword glFunction glMultiTexCoord3s
syntax keyword glFunction glMultiTexCoord3sv
syntax keyword glFunction glMultiTexCoord4d
syntax keyword glFunction glMultiTexCoord4dv
syntax keyword glFunction glMultiTexCoord4f
syntax keyword glFunction glMultiTexCoord4fv
syntax keyword glFunction glMultiTexCoord4i
syntax keyword glFunction glMultiTexCoord4iv
syntax keyword glFunction glMultiTexCoord4s
syntax keyword glFunction glMultiTexCoord4sv
syntax keyword glFunction glLoadTransposeMatrixd
syntax keyword glFunction glLoadTransposeMatrixf
syntax keyword glFunction glMultTransposeMatrixd
syntax keyword glFunction glMultTransposeMatrixf
syntax keyword glFunction glSampleCoverage
" }}}


" glu.h
if !exists ("c_opengl_no_glu")
" GLU {{{
  " Constants {{{ 
  syn keyword glConstant GLU_EXT_object_space_tess
  syn keyword glConstant GLU_EXT_nurbs_tessellator
  syn keyword glConstant GLU_FALSE GLU_TRUE
  syn keyword glConstant GLU_VERSION_1_1 GLU_VERSION_1_2 GLU_VERSION_1_3
  syn keyword glConstant GLU_VERSION
  syn keyword glConstant GLU_EXTENSIONS

  "Error codes"
  syn keyword glConstant GLU_INVALID_ENUM
  syn keyword glConstant GLU_INVALID_VALUE
  syn keyword glConstant GLU_OUT_OF_MEMORY
  syn keyword glConstant GLU_INVALID_OPERATION

  "NurbsDisplay"
  syn keyword glConstant GLU_OUTLINE_POLYGON
  syn keyword glConstant GLU_OUTLINE_PATCH

  "NurbsCallback"
  syn keyword glConstant GLU_NURBS_ERROR             
  syn keyword glConstant GLU_ERROR                   
  syn keyword glConstant GLU_NURBS_BEGIN             
  syn keyword glConstant GLU_NURBS_BEGIN_EXT         
  syn keyword glConstant GLU_NURBS_VERTEX            
  syn keyword glConstant GLU_NURBS_VERTEX_EXT        
  syn keyword glConstant GLU_NURBS_NORMAL            
  syn keyword glConstant GLU_NURBS_NORMAL_EXT        
  syn keyword glConstant GLU_NURBS_COLOR             
  syn keyword glConstant GLU_NURBS_COLOR_EXT         
  syn keyword glConstant GLU_NURBS_TEXTURE_COORD     
  syn keyword glConstant GLU_NURBS_TEX_COORD_EXT     
  syn keyword glConstant GLU_NURBS_END               
  syn keyword glConstant GLU_NURBS_END_EXT           
  syn keyword glConstant GLU_NURBS_BEGIN_DATA        
  syn keyword glConstant GLU_NURBS_BEGIN_DATA_EXT    
  syn keyword glConstant GLU_NURBS_VERTEX_DATA       
  syn keyword glConstant GLU_NURBS_VERTEX_DATA_EXT   
  syn keyword glConstant GLU_NURBS_NORMAL_DATA       
  syn keyword glConstant GLU_NURBS_NORMAL_DATA_EXT   
  syn keyword glConstant GLU_NURBS_COLOR_DATA        
  syn keyword glConstant GLU_NURBS_COLOR_DATA_EXT    
  syn keyword glConstant GLU_NURBS_TEXTURE_COORD_DATA
  syn keyword glConstant GLU_NURBS_TEX_COORD_DATA_EXT
  syn keyword glConstant GLU_NURBS_END_DATA          
  syn keyword glConstant GLU_NURBS_END_DATA_EXT      

  "NurbsError"
  syn keyword glConstant GLU_NURBS_ERROR1 
  syn keyword glConstant GLU_NURBS_ERROR2 
  syn keyword glConstant GLU_NURBS_ERROR3 
  syn keyword glConstant GLU_NURBS_ERROR4 
  syn keyword glConstant GLU_NURBS_ERROR5 
  syn keyword glConstant GLU_NURBS_ERROR6 
  syn keyword glConstant GLU_NURBS_ERROR7 
  syn keyword glConstant GLU_NURBS_ERROR8 
  syn keyword glConstant GLU_NURBS_ERROR9 
  syn keyword glConstant GLU_NURBS_ERROR10
  syn keyword glConstant GLU_NURBS_ERROR11
  syn keyword glConstant GLU_NURBS_ERROR12
  syn keyword glConstant GLU_NURBS_ERROR13
  syn keyword glConstant GLU_NURBS_ERROR14
  syn keyword glConstant GLU_NURBS_ERROR15
  syn keyword glConstant GLU_NURBS_ERROR16
  syn keyword glConstant GLU_NURBS_ERROR17
  syn keyword glConstant GLU_NURBS_ERROR18
  syn keyword glConstant GLU_NURBS_ERROR19
  syn keyword glConstant GLU_NURBS_ERROR20
  syn keyword glConstant GLU_NURBS_ERROR21
  syn keyword glConstant GLU_NURBS_ERROR22
  syn keyword glConstant GLU_NURBS_ERROR23
  syn keyword glConstant GLU_NURBS_ERROR24
  syn keyword glConstant GLU_NURBS_ERROR25
  syn keyword glConstant GLU_NURBS_ERROR26
  syn keyword glConstant GLU_NURBS_ERROR27
  syn keyword glConstant GLU_NURBS_ERROR28
  syn keyword glConstant GLU_NURBS_ERROR29
  syn keyword glConstant GLU_NURBS_ERROR30
  syn keyword glConstant GLU_NURBS_ERROR31
  syn keyword glConstant GLU_NURBS_ERROR32
  syn keyword glConstant GLU_NURBS_ERROR33
  syn keyword glConstant GLU_NURBS_ERROR34
  syn keyword glConstant GLU_NURBS_ERROR35
  syn keyword glConstant GLU_NURBS_ERROR36
  syn keyword glConstant GLU_NURBS_ERROR37

  "NurbsProperty"
  syn keyword glConstant GLU_AUTO_LOAD_MATRIX     
  syn keyword glConstant GLU_CULLING              
  syn keyword glConstant GLU_SAMPLING_TOLERANCE   
  syn keyword glConstant GLU_DISPLAY_MODE         
  syn keyword glConstant GLU_PARAMETRIC_TOLERANCE 
  syn keyword glConstant GLU_SAMPLING_METHOD      
  syn keyword glConstant GLU_U_STEP               
  syn keyword glConstant GLU_V_STEP               
  syn keyword glConstant GLU_NURBS_MODE           
  syn keyword glConstant GLU_NURBS_MODE_EXT       
  syn keyword glConstant GLU_NURBS_TESSELLATOR    
  syn keyword glConstant GLU_NURBS_TESSELLATOR_EXT
  syn keyword glConstant GLU_NURBS_RENDERER       
  syn keyword glConstant GLU_NURBS_RENDERER_EXT   

  " NurbsSampling
  syn keyword glConstant GLU_OBJECT_PARAMETRIC_ERROR    
  syn keyword glConstant GLU_OBJECT_PARAMETRIC_ERROR_EXT
  syn keyword glConstant GLU_OBJECT_PATH_LENGTH         
  syn keyword glConstant GLU_OBJECT_PATH_LENGTH_EXT     
  syn keyword glConstant GLU_PATH_LENGTH                
  syn keyword glConstant GLU_PARAMETRIC_ERROR           
  syn keyword glConstant GLU_DOMAIN_DISTANCE            

  "NurbsTrim"
  syn keyword glConstant GLU_MAP1_TRIM_2
  syn keyword glConstant GLU_MAP1_TRIM_3

  "QuadricDrawStyle"
  syn keyword glConstant GLU_POINT
  syn keyword glConstant GLU_LINE
  syn keyword glConstant GLU_FILL
  syn keyword glConstant GLU_SILHOUETTE

  " QuadricNormal
  syn keyword glConstant GLU_OUTSIDE
  syn keyword glConstant GLU_INSIDE

  " TessCallback
  syn keyword glConstant GLU_TESS_BEGIN         
  syn keyword glConstant GLU_BEGIN              
  syn keyword glConstant GLU_TESS_VERTEX        
  syn keyword glConstant GLU_VERTEX             
  syn keyword glConstant GLU_TESS_END           
  syn keyword glConstant GLU_END                
  syn keyword glConstant GLU_TESS_ERROR         
  syn keyword glConstant GLU_TESS_EDGE_FLAG     
  syn keyword glConstant GLU_EDGE_FLAG          
  syn keyword glConstant GLU_TESS_COMBINE       
  syn keyword glConstant GLU_TESS_BEGIN_DATA    
  syn keyword glConstant GLU_TESS_VERTEX_DATA   
  syn keyword glConstant GLU_TESS_END_DATA      
  syn keyword glConstant GLU_TESS_ERROR_DATA    
  syn keyword glConstant GLU_TESS_EDGE_FLAG_DATA
  syn keyword glConstant GLU_TESS_COMBINE_DATA  

  " TessContour
  syn keyword glConstant GLU_CW      
  syn keyword glConstant GLU_CCW     
  syn keyword glConstant GLU_INTERIOR
  syn keyword glConstant GLU_EXTERIOR
  syn keyword glConstant GLU_UNKNOWN 

  " TessProperty
  syn keyword glConstant GLU_TESS_WINDING_RULE 
  syn keyword glConstant GLU_TESS_BOUNDARY_ONLY
  syn keyword glConstant GLU_TESS_TOLERANCE    

  " TessError
  syn keyword glConstant GLU_TESS_ERROR1               
  syn keyword glConstant GLU_TESS_ERROR2               
  syn keyword glConstant GLU_TESS_ERROR3               
  syn keyword glConstant GLU_TESS_ERROR4               
  syn keyword glConstant GLU_TESS_ERROR5               
  syn keyword glConstant GLU_TESS_ERROR6               
  syn keyword glConstant GLU_TESS_ERROR7               
  syn keyword glConstant GLU_TESS_ERROR8               
  syn keyword glConstant GLU_TESS_MISSING_BEGIN_POLYGON
  syn keyword glConstant GLU_TESS_MISSING_BEGIN_CONTOUR
  syn keyword glConstant GLU_TESS_MISSING_END_POLYGON  
  syn keyword glConstant GLU_TESS_MISSING_END_CONTOUR  
  syn keyword glConstant GLU_TESS_COORD_TOO_LARGE      
  syn keyword glConstant GLU_TESS_NEED_COMBINE_CALLBACK

  " TessWinding
  syn keyword glConstant GLU_TESS_WINDING_ODD        
  syn keyword glConstant GLU_TESS_WINDING_NONZERO    
  syn keyword glConstant GLU_TESS_WINDING_POSITIVE   
  syn keyword glConstant GLU_TESS_WINDING_NEGATIVE   
  syn keyword glConstant GLU_TESS_WINDING_ABS_GEQ_TWO

" }}}
  " Types {{{
  syntax keyword glType GLUnurbs GLUquadric GLUtesselator
  syntax keyword glType GLUnurbsObj GLUquadricObj GLUtesselatorObj GLUtriangulatorObj
  " }}}
  " Functions {{{
  syntax keyword glFunction gluBeginCurve
  syntax keyword glFunction gluBeginPolygon
  syntax keyword glFunction gluBeginSurface
  syntax keyword glFunction gluBeginTrim
  syntax keyword glFunction gluBuild1DMipmapLevels
  syntax keyword glFunction gluBuild1DMipmaps
  syntax keyword glFunction gluBuild2DMipmapLevels
  syntax keyword glFunction gluBuild2DMipmaps
  syntax keyword glFunction gluBuild3DMipmapLevels
  syntax keyword glFunction gluBuild3DMipmaps
  syntax keyword glFunction gluCheckExtension
  syntax keyword glFunction gluCylinder
  syntax keyword glFunction gluDeleteNurbsRenderer
  syntax keyword glFunction gluDeleteQuadric
  syntax keyword glFunction gluDeleteTess
  syntax keyword glFunction gluDisk
  syntax keyword glFunction gluEndCurve
  syntax keyword glFunction gluEndPolygon
  syntax keyword glFunction gluEndSurface
  syntax keyword glFunction gluEndTrim
  syntax keyword glFunction gluGetNurbsProperty
  syntax keyword glFunction gluGetTessProperty
  syntax keyword glFunction gluLoadSamplingMatrices
  syntax keyword glFunction gluLookAt
  syntax keyword glFunction gluNewNurbsRenderer
  syntax keyword glFunction gluNewQuadric
  syntax keyword glFunction gluNewTess
  syntax keyword glFunction gluNextContour
  syntax keyword glFunction gluNurbsCallback
  syntax keyword glFunction gluNurbsCallbackData
  syntax keyword glFunction gluNurbsCallbackDataEXT
  syntax keyword glFunction gluNurbsCurve
  syntax keyword glFunction gluNurbsProperty
  syntax keyword glFunction gluNurbsSurface
  syntax keyword glFunction gluOrtho2D
  syntax keyword glFunction gluPartialDisk
  syntax keyword glFunction gluPerspective
  syntax keyword glFunction gluPickMatrix
  syntax keyword glFunction gluProject
  syntax keyword glFunction gluPwlCurve
  syntax keyword glFunction gluQuadricCallback
  syntax keyword glFunction gluQuadricDrawStyle
  syntax keyword glFunction gluQuadricNormals
  syntax keyword glFunction gluQuadricOrientation
  syntax keyword glFunction gluQuadricTexture
  syntax keyword glFunction gluScaleImage
  syntax keyword glFunction gluSphere
  syntax keyword glFunction gluTessBeginContour
  syntax keyword glFunction gluTessBeginPolygon
  syntax keyword glFunction gluTessCallback
  syntax keyword glFunction gluTessEndContour
  syntax keyword glFunction gluTessEndPolygon
  syntax keyword glFunction gluTessNormal
  syntax keyword glFunction gluTessProperty
  syntax keyword glFunction gluTessVertex
  syntax keyword glFunction gluUnProject
  syntax keyword glFunction gluUnProject4
  " }}}
" }}} 
endif 


" glut.h
if !exists ("c_opengl_no_glut")
" GLUT {{{
  " Constants {{{
  syntax keyword glConstant GLUT_RGB
  syntax keyword glConstant GLUT_RGBA
  syntax keyword glConstant GLUT_INDEX
  syntax keyword glConstant GLUT_SINGLE
  syntax keyword glConstant GLUT_DOUBLE
  syntax keyword glConstant GLUT_ACCUM
  syntax keyword glConstant GLUT_ALPHA
  syntax keyword glConstant GLUT_DEPTH
  syntax keyword glConstant GLUT_STENCIL
  syntax keyword glConstant GLUT_MULTISAMPLE
  syntax keyword glConstant GLUT_STEREO
  syntax keyword glConstant GLUT_LUMINANCE
  syntax keyword glConstant GLUT_LEFT_BUTTON
  syntax keyword glConstant GLUT_MIDDLE_BUTTON
  syntax keyword glConstant GLUT_RIGHT_BUTTON
  syntax keyword glConstant GLUT_DOWN
  syntax keyword glConstant GLUT_UP
  syntax keyword glConstant GLUT_KEY_F1
  syntax keyword glConstant GLUT_KEY_F2
  syntax keyword glConstant GLUT_KEY_F3
  syntax keyword glConstant GLUT_KEY_F4
  syntax keyword glConstant GLUT_KEY_F5
  syntax keyword glConstant GLUT_KEY_F6
  syntax keyword glConstant GLUT_KEY_F7
  syntax keyword glConstant GLUT_KEY_F8
  syntax keyword glConstant GLUT_KEY_F9
  syntax keyword glConstant GLUT_KEY_F10
  syntax keyword glConstant GLUT_KEY_F11
  syntax keyword glConstant GLUT_KEY_F12
  syntax keyword glConstant GLUT_KEY_LEFT
  syntax keyword glConstant GLUT_KEY_UP
  syntax keyword glConstant GLUT_KEY_RIGHT
  syntax keyword glConstant GLUT_KEY_DOWN
  syntax keyword glConstant GLUT_KEY_PAGE_UP
  syntax keyword glConstant GLUT_KEY_PAGE_DOWN
  syntax keyword glConstant GLUT_KEY_HOME
  syntax keyword glConstant GLUT_KEY_END
  syntax keyword glConstant GLUT_KEY_INSERT
  syntax keyword glConstant GLUT_LEFT
  syntax keyword glConstant GLUT_ENTERED
  syntax keyword glConstant GLUT_MENU_NOT_IN_USE
  syntax keyword glConstant GLUT_MENU_IN_USE
  syntax keyword glConstant GLUT_NOT_VISIBLE
  syntax keyword glConstant GLUT_VISIBLE
  syntax keyword glConstant GLUT_HIDDEN
  syntax keyword glConstant GLUT_FULLY_RETAINED
  syntax keyword glConstant GLUT_PARTIALLY_RETAINED
  syntax keyword glConstant GLUT_FULLY_COVERED
  syntax keyword glConstant GLUT_RED
  syntax keyword glConstant GLUT_GREEN
  syntax keyword glConstant GLUT_BLUE
  syntax keyword glConstant GLUT_NORMAL
  syntax keyword glConstant GLUT_OVERLAY
  syntax keyword glConstant GLUT_STROKE_ROMAN
  syntax keyword glConstant GLUT_STROKE_MONO_ROMAN
  syntax keyword glConstant GLUT_BITMAP_9_BY_15
  syntax keyword glConstant GLUT_BITMAP_8_BY_13
  syntax keyword glConstant GLUT_BITMAP_TIMES_ROMAN_10
  syntax keyword glConstant GLUT_BITMAP_TIMES_ROMAN_24
  syntax keyword glConstant GLUT_BITMAP_HELVETICA_10
  syntax keyword glConstant GLUT_BITMAP_HELVETICA_12
  syntax keyword glConstant GLUT_BITMAP_HELVETICA_18
  syntax keyword glConstant GLUT_STROKE_ROMAN
  syntax keyword glConstant GLUT_STROKE_MONO_ROMAN
  syntax keyword glConstant GLUT_BITMAP_9_BY_15
  syntax keyword glConstant GLUT_BITMAP_8_BY_13
  syntax keyword glConstant GLUT_BITMAP_TIMES_ROMAN_10
  syntax keyword glConstant GLUT_BITMAP_TIMES_ROMAN_24
  syntax keyword glConstant GLUT_BITMAP_HELVETICA_10
  syntax keyword glConstant GLUT_BITMAP_HELVETICA_12
  syntax keyword glConstant GLUT_BITMAP_HELVETICA_18
  syntax keyword glConstant GLUT_WINDOW_X
  syntax keyword glConstant GLUT_WINDOW_Y
  syntax keyword glConstant GLUT_WINDOW_WIDTH
  syntax keyword glConstant GLUT_WINDOW_HEIGHT
  syntax keyword glConstant GLUT_WINDOW_BUFFER_SIZE
  syntax keyword glConstant GLUT_WINDOW_STENCIL_SIZE
  syntax keyword glConstant GLUT_WINDOW_DEPTH_SIZE
  syntax keyword glConstant GLUT_WINDOW_RED_SIZE
  syntax keyword glConstant GLUT_WINDOW_GREEN_SIZE
  syntax keyword glConstant GLUT_WINDOW_BLUE_SIZE
  syntax keyword glConstant GLUT_WINDOW_ALPHA_SIZE
  syntax keyword glConstant GLUT_WINDOW_ACCUM_RED_SIZE
  syntax keyword glConstant GLUT_WINDOW_ACCUM_GREEN_SIZE
  syntax keyword glConstant GLUT_WINDOW_ACCUM_BLUE_SIZE
  syntax keyword glConstant GLUT_WINDOW_ACCUM_ALPHA_SIZE
  syntax keyword glConstant GLUT_WINDOW_DOUBLEBUFFER
  syntax keyword glConstant GLUT_WINDOW_RGBA
  syntax keyword glConstant GLUT_WINDOW_PARENT
  syntax keyword glConstant GLUT_WINDOW_NUM_CHILDREN
  syntax keyword glConstant GLUT_WINDOW_COLORMAP_SIZE
  syntax keyword glConstant GLUT_WINDOW_NUM_SAMPLES
  syntax keyword glConstant GLUT_WINDOW_STEREO
  syntax keyword glConstant GLUT_WINDOW_CURSOR
  syntax keyword glConstant GLUT_SCREEN_WIDTH
  syntax keyword glConstant GLUT_SCREEN_HEIGHT
  syntax keyword glConstant GLUT_SCREEN_WIDTH_MM
  syntax keyword glConstant GLUT_SCREEN_HEIGHT_MM
  syntax keyword glConstant GLUT_MENU_NUM_ITEMS
  syntax keyword glConstant GLUT_DISPLAY_MODE_POSSIBLE
  syntax keyword glConstant GLUT_INIT_WINDOW_X
  syntax keyword glConstant GLUT_INIT_WINDOW_Y
  syntax keyword glConstant GLUT_INIT_WINDOW_WIDTH
  syntax keyword glConstant GLUT_INIT_WINDOW_HEIGHT
  syntax keyword glConstant GLUT_INIT_DISPLAY_MODE
  syntax keyword glConstant GLUT_ELAPSED_TIME
  syntax keyword glConstant GLUT_WINDOW_FORMAT_ID
  syntax keyword glConstant GLUT_HAS_KEYBOARD
  syntax keyword glConstant GLUT_HAS_MOUSE
  syntax keyword glConstant GLUT_HAS_SPACEBALL
  syntax keyword glConstant GLUT_HAS_DIAL_AND_BUTTON_BOX
  syntax keyword glConstant GLUT_HAS_TABLET
  syntax keyword glConstant GLUT_NUM_MOUSE_BUTTONS
  syntax keyword glConstant GLUT_NUM_SPACEBALL_BUTTONS
  syntax keyword glConstant GLUT_NUM_BUTTON_BOX_BUTTONS
  syntax keyword glConstant GLUT_NUM_DIALS
  syntax keyword glConstant GLUT_NUM_TABLET_BUTTONS
  syntax keyword glConstant GLUT_DEVICE_IGNORE_KEY_REPEAT
  syntax keyword glConstant GLUT_DEVICE_KEY_REPEAT
  syntax keyword glConstant GLUT_HAS_JOYSTICK
  syntax keyword glConstant GLUT_OWNS_JOYSTICK
  syntax keyword glConstant GLUT_JOYSTICK_BUTTONS
  syntax keyword glConstant GLUT_JOYSTICK_AXES
  syntax keyword glConstant GLUT_JOYSTICK_POLL_RATE
  syntax keyword glConstant GLUT_OVERLAY_POSSIBLE
  syntax keyword glConstant GLUT_LAYER_IN_USE
  syntax keyword glConstant GLUT_HAS_OVERLAY
  syntax keyword glConstant GLUT_TRANSPARENT_INDEX
  syntax keyword glConstant GLUT_NORMAL_DAMAGED
  syntax keyword glConstant GLUT_OVERLAY_DAMAGED
  syntax keyword glConstant GLUT_VIDEO_RESIZE_POSSIBLE
  syntax keyword glConstant GLUT_VIDEO_RESIZE_IN_USE
  syntax keyword glConstant GLUT_VIDEO_RESIZE_X_DELTA
  syntax keyword glConstant GLUT_VIDEO_RESIZE_Y_DELTA
  syntax keyword glConstant GLUT_VIDEO_RESIZE_WIDTH_DELTA
  syntax keyword glConstant GLUT_VIDEO_RESIZE_HEIGHT_DELTA
  syntax keyword glConstant GLUT_VIDEO_RESIZE_X
  syntax keyword glConstant GLUT_VIDEO_RESIZE_Y
  syntax keyword glConstant GLUT_VIDEO_RESIZE_WIDTH
  syntax keyword glConstant GLUT_VIDEO_RESIZE_HEIGHT
  syntax keyword glConstant GLUT_NORMAL
  syntax keyword glConstant GLUT_OVERLAY
  syntax keyword glConstant GLUT_ACTIVE_SHIFT
  syntax keyword glConstant GLUT_ACTIVE_CTRL
  syntax keyword glConstant GLUT_ACTIVE_ALT
  syntax keyword glConstant GLUT_CURSOR_RIGHT_ARROW
  syntax keyword glConstant GLUT_CURSOR_LEFT_ARROW
  syntax keyword glConstant GLUT_CURSOR_INFO
  syntax keyword glConstant GLUT_CURSOR_DESTROY
  syntax keyword glConstant GLUT_CURSOR_HELP
  syntax keyword glConstant GLUT_CURSOR_CYCLE
  syntax keyword glConstant GLUT_CURSOR_SPRAY
  syntax keyword glConstant GLUT_CURSOR_WAIT
  syntax keyword glConstant GLUT_CURSOR_TEXT
  syntax keyword glConstant GLUT_CURSOR_CROSSHAIR
  syntax keyword glConstant GLUT_CURSOR_UP_DOWN
  syntax keyword glConstant GLUT_CURSOR_LEFT_RIGHT
  syntax keyword glConstant GLUT_CURSOR_TOP_SIDE
  syntax keyword glConstant GLUT_CURSOR_BOTTOM_SIDE
  syntax keyword glConstant GLUT_CURSOR_LEFT_SIDE
  syntax keyword glConstant GLUT_CURSOR_RIGHT_SIDE
  syntax keyword glConstant GLUT_CURSOR_TOP_LEFT_CORNER
  syntax keyword glConstant GLUT_CURSOR_TOP_RIGHT_CORNER
  syntax keyword glConstant GLUT_CURSOR_BOTTOM_RIGHT_CORNER
  syntax keyword glConstant GLUT_CURSOR_BOTTOM_LEFT_CORNER
  syntax keyword glConstant GLUT_CURSOR_INHERIT
  syntax keyword glConstant GLUT_CURSOR_NONE
  syntax keyword glConstant GLUT_CURSOR_FULL_CROSSHAIR
  syntax keyword glConstant GLUT_KEY_REPEAT_OFF
  syntax keyword glConstant GLUT_KEY_REPEAT_ON
  syntax keyword glConstant GLUT_KEY_REPEAT_DEFAULT
  syntax keyword glConstant GLUT_JOYSTICK_BUTTON_A
  syntax keyword glConstant GLUT_JOYSTICK_BUTTON_B
  syntax keyword glConstant GLUT_JOYSTICK_BUTTON_C
  syntax keyword glConstant GLUT_JOYSTICK_BUTTON_D
  syntax keyword glConstant GLUT_GAME_MODE_ACTIVE
  syntax keyword glConstant GLUT_GAME_MODE_POSSIBLE
  syntax keyword glConstant GLUT_GAME_MODE_WIDTH 
  syntax keyword glConstant GLUT_GAME_MODE_HEIGHT
  syntax keyword glConstant GLUT_GAME_MODE_PIXEL_DEPTH
  syntax keyword glConstant GLUT_GAME_MODE_REFRESH_RATE
  syntax keyword glConstant GLUT_GAME_MODE_DISPLAY_CHANGED
  " }}}

  " Functions {{{
  syntax keyword glFunction  glutInit
  syntax keyword glFunction  glutInitDisplayMode
  syntax keyword glFunction  glutInitDisplayString
  syntax keyword glFunction  glutInitWindowPosition
  syntax keyword glFunction  glutInitWindowSize
  syntax keyword glFunction  glutMainLoop
  syntax keyword glFunction  glutCreateWindow
  syntax keyword glFunction  glutCreateSubWindow
  syntax keyword glFunction  glutDestroyWindow
  syntax keyword glFunction  glutPostRedisplay
  syntax keyword glFunction  glutPostWindowRedisplay
  syntax keyword glFunction  glutSwapBuffers
  syntax keyword glFunction  glutGetWindow
  syntax keyword glFunction  glutSetWindow
  syntax keyword glFunction  glutSetWindowTitle
  syntax keyword glFunction  glutSetIconTitle
  syntax keyword glFunction  glutPositionWindow
  syntax keyword glFunction  glutReshapeWindow
  syntax keyword glFunction  glutPopWindow
  syntax keyword glFunction  glutPushWindow
  syntax keyword glFunction  glutIconifyWindow
  syntax keyword glFunction  glutShowWindow
  syntax keyword glFunction  glutHideWindow
  syntax keyword glFunction  glutFullScreen
  syntax keyword glFunction  glutSetCursor
  syntax keyword glFunction  glutWarpPointer
  syntax keyword glFunction  glutEstablishOverlay
  syntax keyword glFunction  glutRemoveOverlay
  syntax keyword glFunction  glutUseLayer
  syntax keyword glFunction  glutPostOverlayRedisplay
  syntax keyword glFunction  glutPostWindowOverlayRedisplay
  syntax keyword glFunction  glutShowOverlay
  syntax keyword glFunction  glutHideOverlay
  syntax keyword glFunction  glutDestroyMenu
  syntax keyword glFunction  glutGetMenu
  syntax keyword glFunction  glutSetMenu
  syntax keyword glFunction  glutAddMenuEntry
  syntax keyword glFunction  glutAddSubMenu
  syntax keyword glFunction  glutChangeToMenuEntry
  syntax keyword glFunction  glutChangeToSubMenu
  syntax keyword glFunction  glutRemoveMenuItem
  syntax keyword glFunction  glutAttachMenu
  syntax keyword glFunction  glutDetachMenu
  syntax keyword glFunction  glutDisplayFunc
  syntax keyword glFunction  glutReshapeFunc
  syntax keyword glFunction  glutKeyboardFunc
  syntax keyword glFunction  glutMouseFunc
  syntax keyword glFunction  glutMotionFunc
  syntax keyword glFunction  glutPassiveMotionFunc
  syntax keyword glFunction  glutEntryFunc
  syntax keyword glFunction  glutVisibilityFunc
  syntax keyword glFunction  glutIdleFunc
  syntax keyword glFunction  glutTimerFunc
  syntax keyword glFunction  glutMenuStateFunc
  syntax keyword glFunction  glutSpecialFunc
  syntax keyword glFunction  glutSpaceballMotionFunc
  syntax keyword glFunction  glutSpaceballRotateFunc
  syntax keyword glFunction  glutSpaceballButtonFunc
  syntax keyword glFunction  glutButtonBoxFunc
  syntax keyword glFunction  glutDialsFunc
  syntax keyword glFunction  glutTabletMotionFunc
  syntax keyword glFunction  glutTabletButtonFunc
  syntax keyword glFunction  glutMenuStatusFunc
  syntax keyword glFunction  glutOverlayDisplayFunc
  syntax keyword glFunction  glutWindowStatusFunc
  syntax keyword glFunction  glutKeyboardUpFunc
  syntax keyword glFunction  glutSpecialUpFunc
  syntax keyword glFunction  glutJoystickFunc
  syntax keyword glFunction  glutSetColor
  syntax keyword glFunction  glutGetColor
  syntax keyword glFunction  glutCopyColormap
  syntax keyword glFunction  glutGet
  syntax keyword glFunction  glutDeviceGet
  syntax keyword glFunction  glutGetModifiers
  syntax keyword glFunction  glutLayerGet
  syntax keyword glFunction  glutGetProcAddress
  syntax keyword glFunction  glutBitmapCharacter
  syntax keyword glFunction  glutBitmapWidth
  syntax keyword glFunction  glutStrokeCharacter
  syntax keyword glFunction  glutStrokeWidth
  syntax keyword glFunction  glutBitmapLength
  syntax keyword glFunction  glutStrokeLength
  syntax keyword glFunction  glutWireSphere
  syntax keyword glFunction  glutSolidSphere
  syntax keyword glFunction  glutWireCone
  syntax keyword glFunction  glutSolidCone
  syntax keyword glFunction  glutWireCube
  syntax keyword glFunction  glutSolidCube
  syntax keyword glFunction  glutWireTorus
  syntax keyword glFunction  glutSolidTorus
  syntax keyword glFunction  glutWireDodecahedron
  syntax keyword glFunction  glutSolidDodecahedron
  syntax keyword glFunction  glutWireTeapot
  syntax keyword glFunction  glutSolidTeapot
  syntax keyword glFunction  glutWireOctahedron
  syntax keyword glFunction  glutSolidOctahedron
  syntax keyword glFunction  glutWireTetrahedron
  syntax keyword glFunction  glutSolidTetrahedron
  syntax keyword glFunction  glutWireIcosahedron
  syntax keyword glFunction  glutSolidIcosahedron
  syntax keyword glFunction  glutVideoResizeGet
  syntax keyword glFunction  glutSetupVideoResizing
  syntax keyword glFunction  glutStopVideoResizing
  syntax keyword glFunction  glutVideoResize
  syntax keyword glFunction  glutVideoPan
  syntax keyword glFunction  glutReportErrors
  syntax keyword glFunction  glutIgnoreKeyRepeat
  syntax keyword glFunction  glutSetKeyRepeat
  syntax keyword glFunction  glutForceJoystickFunc
  syntax keyword glFunction  glutGameModeString
  syntax keyword glFunction  glutEnterGameMode
  syntax keyword glFunction  glutLeaveGameMode
  syntax keyword glFunction  glutGameModeGet
  " }}}
" }}}
endif

" gles2/gl.h
if !exists ("c_opengl_no_gles2")
" GLES2 {{{
  " Data types {{{
  syntax keyword glType GLfixed
  syntax keyword glType GLclampx
  syntax keyword glType GLintptr
  syntax keyword glType GLsizeiptr
  " }}}

  " Constants {{{
  " BlendEquationSeperate
  syntax keyword glConstant GL_FUNC_ADD
  syntax keyword glConstant GL_BLEND_EQUATION
  syntax keyword glConstant GL_BLEND_EQUATION_RGB
  syntax keyword glConstant GL_BLEND_EQUATION_ALPHA

  " BlendSubtract
  syntax keyword glConstant GL_FUNC_SUBTRACT
  syntax keyword glConstant GL_FUNC_REVERSE_SUBTRACT

  " Buffer Objects
  syntax keyword glConstant GL_ARRAY_BUFFER
  syntax keyword glConstant GL_ELEMENT_ARRAY_BUFFER
  syntax keyword glConstant GL_ARRAY_BUFFER_BINDING
  syntax keyword glConstant GL_ELEMENT_ARRAY_BUFFER_BINDING
  syntax keyword glConstant GL_STATIC_DRAW
  syntax keyword glConstant GL_DYNAMIC_DRAW
  syntax keyword glConstant GL_STREAM_DRAW
  syntax keyword glConstant GL_WRITE_ONLY
  syntax keyword glConstant GL_BUFFER_SIZE
  syntax keyword glConstant GL_BUFFER_USAGE
  syntax keyword glConstant GL_BUFFER_ACCESS
  syntax keyword glConstant GL_CURRENT_VERTEX_ATTRIB

  " GetPName
  syntax keyword glConstant GL_STENCIL_BACK_FUNC
  syntax keyword glConstant GL_STENCIL_BACK_FAIL
  syntax keyword glConstant GL_STENCIL_BACK_PASS_DEPTH_FAIL
  syntax keyword glConstant GL_STENCIL_BACK_PASS_DEPTH_PASS
  syntax keyword glConstant GL_STENCIL_BACK_REF
  syntax keyword glConstant GL_STENCIL_BACK_VALUE_MASK
  syntax keyword glConstant GL_STENCIL_BACK_WRITEMASK
  syntax keyword glConstant GL_SUBPIXEL_BITS

  " HintTarget
  syntax keyword glConstant GL_FRAGMENT_SHADER_DERIVATIVE_HINT

  " DataType
  syntax keyword glConstant GL_FIXED

  " PixelFormat
  syntax keyword glConstant GL_LUMINANCE_ALPHA

  " Shaders
  syntax keyword glConstant GL_VERTEX_PROGRAM_POINT_SIZE
  syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_NORMALIZED
  syntax keyword glConstant GL_FRAGMENT_SHADER
  syntax keyword glConstant GL_VERTEX_SHADER
  syntax keyword glConstant GL_MAX_VERTEX_ATTRIBS
  syntax keyword glConstant GL_MAX_VERTEX_UNIFORM_COMPONENTS
  syntax keyword glConstant GL_MAX_VARYING_FLOATS
  syntax keyword glConstant GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS
  syntax keyword glConstant GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS
  syntax keyword glConstant GL_MAX_TEXTURE_IMAGE_UNITS
  syntax keyword glConstant GL_MAX_FRAGMENT_UNIFORM_COMPONENTS
  syntax keyword glConstant GL_SHADER_TYPE
  syntax keyword glConstant GL_DELETE_STATUS
  syntax keyword glConstant GL_LINK_STATUS
  syntax keyword glConstant GL_VALIDATE_STATUS
  syntax keyword glConstant GL_ATTACHED_SHADERS
  syntax keyword glConstant GL_ACTIVE_UNIFORMS
  syntax keyword glConstant GL_ACTIVE_UNIFORM_MAX_LENGTH
  syntax keyword glConstant GL_ACTIVE_ATTRIBUTES
  syntax keyword glConstant GL_ACTIVE_ATTRIBUTE_MAX_LENGTH
  syntax keyword glConstant GL_SHADING_LANGUAGE_VERSION
  syntax keyword glConstant GL_CURRENT_PROGRAM

  " Vertex Arrays
  syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_ENABLED
  syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_SIZE
  syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_STRIDE
  syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_TYPE
  syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_NORMALIZED
  syntax keyword glConstant GL_VERTEX_ATTRIB_ARRAY_POINTER

  " OES_read_format
  syntax keyword glConstant GL_IMPLEMENTATION_COLOR_READ_TYPE_OES
  syntax keyword glConstant GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES

  " OES_compressed_paletted_texture
  syntax keyword glConstant GL_PALETTE4_RGB8_OES
  syntax keyword glConstant GL_PALETTE4_RGBA8_OES
  syntax keyword glConstant GL_PALETTE4_R5_G6_B5_OES
  syntax keyword glConstant GL_PALETTE4_RGBA4_OES
  syntax keyword glConstant GL_PALETTE4_RGB5_A1_OES
  syntax keyword glConstant GL_PALETTE8_RGB8_OES
  syntax keyword glConstant GL_PALETTE8_RGBA8_OES
  syntax keyword glConstant GL_PALETTE8_R5_G6_B5_OES
  syntax keyword glConstant GL_PALETTE8_RGBA4_OES
  syntax keyword glConstant GL_PALETTE8_RGB5_A1_OES

  " OES_framebuffer_object
  syntax keyword glConstant GL_FRAMEBUFFER_OES
  syntax keyword glConstant GL_RENDERBUFFER_OES
  syntax keyword glConstant GL_RGB565_OES
  syntax keyword glConstant GL_STENCIL_INDEX_OES
  syntax keyword glConstant GL_RENDERBUFFER_WIDTH_OES
  syntax keyword glConstant GL_RENDERBUFFER_HEIGHT_OES
  syntax keyword glConstant GL_RENDERBUFFER_INTERNAL_FORMAT_OES
  syntax keyword glConstant GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_OES
  syntax keyword glConstant GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_OES
  syntax keyword glConstant GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_OES
  syntax keyword glConstant GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_OES
  syntax keyword glConstant GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT0_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT1_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT2_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT3_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT4_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT5_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT6_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT7_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT8_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT9_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT10_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT11_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT12_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT13_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT14_OES
  syntax keyword glConstant GL_COLOR_ATTACHMENT15_OES
  syntax keyword glConstant GL_DEPTH_ATTACHMENT_OES
  syntax keyword glConstant GL_STENCIL_ATTACHMENT_OES
  syntax keyword glConstant GL_FRAMEBUFFER_COMPLETE_OES
  syntax keyword glConstant GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_OES
  syntax keyword glConstant GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_OES
  syntax keyword glConstant GL_FRAMEBUFFER_INCOMPLETE_DUPLICATE_ATTACHMENT_OES
  syntax keyword glConstant GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_OES
  syntax keyword glConstant GL_FRAMEBUFFER_INCOMPLETE_FORMATS_OES
  syntax keyword glConstant GL_FRAMEBUFFER_UNSUPPORTED_OES
  syntax keyword glConstant GL_FRAMEBUFFER_STATUS_ERROR_OES
  syntax keyword glConstant GL_FRAMEBUFFER_BINDING_OES
  syntax keyword glConstant GL_RENDERBUFFER_BINDING_OES
  syntax keyword glConstant GL_MAX_COLOR_ATTACHMENTS_OES
  syntax keyword glConstant GL_MAX_RENDERBUFFER_SIZE_OES
  syntax keyword glConstant GL_INVALID_FRAMEBUFFER_OPERATION_OES

  " OES_stencil1
  syntax keyword glConstant GL_STENCIL_INDEX1_OES

  " OES_stencil4
  syntax keyword glConstant GL_STENCIL_INDEX4_OES

  " OES_stencil8
  syntax keyword glConstant GL_STENCIL_INDEX8_OES

  " OES_vertex_half_float
  syntax keyword glConstant GL_HALF_FLOAT_OES

  " OES_compressed_ETC1_RGB8_texture
  syntax keyword glConstant GL_ETC1_RGB8_OES

  " OES_mapbuffer
  syntax keyword glConstant GL_BUFFER_MAPPED
  syntax keyword glConstant GL_BUFFER_MAP_POINTER

  " OES_shader_source
  syntax keyword glConstant GL_COMPILE_STATUS
  syntax keyword glConstant GL_INFO_LOG_LENGTH
  syntax keyword glConstant GL_SHADER_SOURCE_LENGTH

  " OES_shader_binary
  syntax keyword glConstant GL_PLATFORM_BINARY_OES
  " }}}

  " Functions {{{
  syntax keyword glFunction glAttachShader
  syntax keyword glFunction glBindAttribLocation
  syntax keyword glFunction glBindBuffer
  syntax keyword glFunction glBlendEquationSeparate
  syntax keyword glFunction glBlendFuncSeparate
  syntax keyword glFunction glBufferData
  syntax keyword glFunction glBufferSubData
  syntax keyword glFunction glClearDepthf
  syntax keyword glFunction glCreateProgram
  syntax keyword glFunction glCreateShader
  syntax keyword glFunction glDeleteBuffers
  syntax keyword glFunction glDeleteProgram
  syntax keyword glFunction glDeleteShader
  syntax keyword glFunction glDetachShader
  syntax keyword glFunction glDepthRangef
  syntax keyword glFunction glDisableVertexAttribArray
  syntax keyword glFunction glEnableVertexAttribArray
  syntax keyword glFunction glGetActiveAttrib
  syntax keyword glFunction glGetActiveUniform
  syntax keyword glFunction glGetAttachedShaders
  syntax keyword glFunction glGetAttribLocation
  syntax keyword glFunction glGetBufferParameteriv
  syntax keyword glFunction glGenBuffers
  syntax keyword glFunction glGetProgramiv
  syntax keyword glFunction glGetProgramInfoLog
  syntax keyword glFunction glGetUniformfv
  syntax keyword glFunction glGetUniformiv
  syntax keyword glFunction glGetUniformLocation
  syntax keyword glFunction glGetVertexAttribfv
  syntax keyword glFunction glGetVertexAttribiv
  syntax keyword glFunction glGetVertexAttribPointerv
  syntax keyword glFunction glIsBuffer
  syntax keyword glFunction glIsProgram
  syntax keyword glFunction glIsShader
  syntax keyword glFunction glLinkProgram
  syntax keyword glFunction glStencilFuncSeparate
  syntax keyword glFunction glStencilMaskSeparate
  syntax keyword glFunction glStencilOpSeparate
  syntax keyword glFunction glUniform1i
  syntax keyword glFunction glUniform2i
  syntax keyword glFunction glUniform3i
  syntax keyword glFunction glUniform4i
  syntax keyword glFunction glUniform1f
  syntax keyword glFunction glUniform2f
  syntax keyword glFunction glUniform3f
  syntax keyword glFunction glUniform4f
  syntax keyword glFunction glUniform1iv
  syntax keyword glFunction glUniform2iv
  syntax keyword glFunction glUniform3iv
  syntax keyword glFunction glUniform4iv
  syntax keyword glFunction glUniform1fv
  syntax keyword glFunction glUniform2fv
  syntax keyword glFunction glUniform3fv
  syntax keyword glFunction glUniform4fv
  syntax keyword glFunction glUniformMatrix2fv
  syntax keyword glFunction glUniformMatrix3fv
  syntax keyword glFunction glUniformMatrix4fv
  syntax keyword glFunction glUseProgram
  syntax keyword glFunction glValidateProgram
  syntax keyword glFunction glVertexAttrib1f
  syntax keyword glFunction glVertexAttrib2f
  syntax keyword glFunction glVertexAttrib3f
  syntax keyword glFunction glVertexAttrib4f
  syntax keyword glFunction glVertexAttrib1fv
  syntax keyword glFunction glVertexAttrib2fv
  syntax keyword glFunction glVertexAttrib3fv
  syntax keyword glFunction glVertexAttrib4fv
  syntax keyword glFunction glVertexAttribPointer

  " OES_framebuffer_object
  syntax keyword glFunction glIsRenderbufferOES
  syntax keyword glFunction glBindRenderbufferOES
  syntax keyword glFunction glDeleteRenderbuffersOES
  syntax keyword glFunction glGenRenderbuffersOES
  syntax keyword glFunction glRenderbufferStorageOES
  syntax keyword glFunction glGetRenderbufferParameterivOES
  syntax keyword glFunction glGetRenderbufferStorageFormatsivOES
  syntax keyword glFunction glIsFramebufferOES
  syntax keyword glFunction glBindFramebufferOES
  syntax keyword glFunction glDeleteFramebuffersOES
  syntax keyword glFunction glGenFramebuffersOES
  syntax keyword glFunction glCheckFramebufferStatusOES
  syntax keyword glFunction glFramebufferTexture2DOES
  syntax keyword glFunction glFramebufferTexture3DOES
  syntax keyword glFunction glFramebufferRenderbufferOES
  syntax keyword glFunction glGetFramebufferAttachmentParameterivOES
  syntax keyword glFunction glGenerateMipmapOES

  " OES_mapbuffer
  syntax keyword glFunction glMapBuffer
  syntax keyword glFunction glUnmapBuffer

  " OES_shader_source
  syntax keyword glFunction glCompileShader
  syntax keyword glFunction glGetShaderiv
  syntax keyword glFunction glGetShaderInfoLog
  syntax keyword glFunction glGetShaderSource
  syntax keyword glFunction glReleaseShaderCompilerOES
  syntax keyword glFunction glShaderSource

  " OES_shader_binary
  syntax keyword glFunction glShaderBinaryOES

  " OES_shader_source + OES_shader_binary
  syntax keyword glFunction glGetShaderPrecisionFormatOES

  " }}}
" }}}
endif

" egl.h
if !exists ("c_opengl_no_egl")
" EGL {{{
  " Data types {{{
  syntax keyword glType EGLint
  syntax keyword glType EGLenum
  syntax keyword glType EGLBoolean
  syntax keyword glType EGLConfig
  syntax keyword glType EGLContext
  syntax keyword glType EGLDisplay
  syntax keyword glType EGLSurface
  syntax keyword glType EGLClientBuffer
  syntax keyword glType NativeDisplayType
  syntax keyword glType NativeWindowType
  syntax keyword glType NativePixmapType
  " }}}

  " Constants {{{
  " API handles 
  syntax keyword glConstant EGL_DEFAULT_DISPLAY
  syntax keyword glConstant EGL_NO_CONTEXT
  syntax keyword glConstant EGL_NO_DISPLAY
  syntax keyword glConstant EGL_NO_SURFACE

  " Boolean
  syntax keyword glConstant EGL_FALSE
  syntax keyword glConstant EGL_TRUE

  " Errors
  syntax keyword glConstant EGL_SUCCESS
  syntax keyword glConstant EGL_NOT_INITIALIZED
  syntax keyword glConstant EGL_BAD_ACCESS
  syntax keyword glConstant EGL_BAD_ALLOC
  syntax keyword glConstant EGL_BAD_ATTRIBUTE
  syntax keyword glConstant EGL_BAD_CONFIG
  syntax keyword glConstant EGL_BAD_CONTEXT
  syntax keyword glConstant EGL_BAD_CURRENT_SURFACE
  syntax keyword glConstant EGL_BAD_DISPLAY
  syntax keyword glConstant EGL_BAD_MATCH
  syntax keyword glConstant EGL_BAD_NATIVE_PIXMAP
  syntax keyword glConstant EGL_BAD_NATIVE_WINDOW
  syntax keyword glConstant EGL_BAD_PARAMETER
  syntax keyword glConstant EGL_BAD_SURFACE
  syntax keyword glConstant EGL_CONTEXT_LOST

  " Config attributes
  syntax keyword glConstant EGL_BUFFER_SIZE
  syntax keyword glConstant EGL_ALPHA_SIZE
  syntax keyword glConstant EGL_BLUE_SIZE
  syntax keyword glConstant EGL_GREEN_SIZE
  syntax keyword glConstant EGL_RED_SIZE
  syntax keyword glConstant EGL_DEPTH_SIZE
  syntax keyword glConstant EGL_STENCIL_SIZE
  syntax keyword glConstant EGL_CONFIG_CAVEAT
  syntax keyword glConstant EGL_CONFIG_ID
  syntax keyword glConstant EGL_LEVEL
  syntax keyword glConstant EGL_MAX_PBUFFER_HEIGHT
  syntax keyword glConstant EGL_MAX_PBUFFER_PIXELS
  syntax keyword glConstant EGL_MAX_PBUFFER_WIDTH
  syntax keyword glConstant EGL_NATIVE_RENDERABLE
  syntax keyword glConstant EGL_NATIVE_VISUAL_ID
  syntax keyword glConstant EGL_NATIVE_VISUAL_TYPE
  syntax keyword glConstant EGL_PRESERVED_RESOURCES
  syntax keyword glConstant EGL_SAMPLES
  syntax keyword glConstant EGL_SAMPLE_BUFFERS
  syntax keyword glConstant EGL_SURFACE_TYPE
  syntax keyword glConstant EGL_TRANSPARENT_TYPE
  syntax keyword glConstant EGL_TRANSPARENT_BLUE_VALUE
  syntax keyword glConstant EGL_TRANSPARENT_GREEN_VALUE
  syntax keyword glConstant EGL_TRANSPARENT_RED_VALUE
  syntax keyword glConstant EGL_BIND_TO_TEXTURE_RGB
  syntax keyword glConstant EGL_BIND_TO_TEXTURE_RGBA
  syntax keyword glConstant EGL_MIN_SWAP_INTERVAL
  syntax keyword glConstant EGL_MAX_SWAP_INTERVAL
  syntax keyword glConstant EGL_LUMINANCE_SIZE
  syntax keyword glConstant EGL_ALPHA_MASK_SIZE
  syntax keyword glConstant EGL_COLOR_BUFFER_TYPE
  syntax keyword glConstant EGL_RENDERABLE_TYPE
  syntax keyword glConstant EGL_MATCH_NATIVE_PIXMAP

  " Unknown display resolution/aspect ratio
  syntax keyword glConstant EGL_UNKNOWN

  syntax keyword glConstant EGL_RENDER_BUFFER
  syntax keyword glConstant EGL_COLORSPACE
  syntax keyword glConstant EGL_ALPHA_FORMAT
  syntax keyword glConstant EGL_COLORSPACE_sRGB
  syntax keyword glConstant EGL_COLORSPACE_LINEAR
  syntax keyword glConstant EGL_ALPHA_FORMAT_NONPRE
  syntax keyword glConstant EGL_ALPHA_FORMAT_PRE
  syntax keyword glConstant EGL_CLIENT_APIS
  syntax keyword glConstant EGL_RGB_BUFFER
  syntax keyword glConstant EGL_LUMINANCE_BUFFER
  syntax keyword glConstant EGL_HORIZONTAL_RESOLUTION
  syntax keyword glConstant EGL_VERTICAL_RESOLUTION
  syntax keyword glConstant EGL_PIXEL_ASPECT_RATIO
  syntax keyword glConstant EGL_SWAP_BEHAVIOR
  syntax keyword glConstant EGL_BUFFER_PRESERVED
  syntax keyword glConstant EGL_BUFFER_DESTROYED

  " CreatePbufferFromClientBuffer buffer types
  syntax keyword glConstant EGL_OPENVG_IMAGE

  " QueryContext targets
  syntax keyword glConstant EGL_CONTEXT_CLIENT_TYPE
  syntax keyword glConstant EGL_CONTEXT_CLIENT_VERSION

  syntax keyword glConstant EGL_OPENGL_ES_API
  syntax keyword glConstant EGL_OPENVG_API

  " Config attribute and value
  syntax keyword glConstant EGL_NONE

  " Config values
  syntax keyword glConstant EGL_DONT_CARE
  syntax keyword glConstant EGL_PBUFFER_BIT
  syntax keyword glConstant EGL_PIXMAP_BIT
  syntax keyword glConstant EGL_WINDOW_BIT
  syntax keyword glConstant EGL_SLOW_CONFIG
  syntax keyword glConstant EGL_NON_CONFORMANT_CONFIG
  syntax keyword glConstant EGL_TRANSPARENT_RGB

  syntax keyword glConstant EGL_NO_TEXTURE
  syntax keyword glConstant EGL_TEXTURE_RGB
  syntax keyword glConstant EGL_TEXTURE_RGBA
  syntax keyword glConstant EGL_TEXTURE_2D

  syntax keyword glConstant EGL_OPENGL_ES_BIT
  syntax keyword glConstant EGL_OPENVG_BIT
  syntax keyword glConstant EGL_OPENGL_ES2_BIT
  syntax keyword glConstant EGL_DISPLAY_SCALING

  " String names
  syntax keyword glConstant EGL_VENDOR
  syntax keyword glConstant EGL_VERSION
  syntax keyword glConstant EGL_EXTENSIONS

  " Surface attributes
  syntax keyword glConstant EGL_HEIGHT
  syntax keyword glConstant EGL_WIDTH
  syntax keyword glConstant EGL_LARGEST_PBUFFER
  syntax keyword glConstant EGL_TEXTURE_FORMAT
  syntax keyword glConstant EGL_TEXTURE_TARGET
  syntax keyword glConstant EGL_MIPMAP_TEXTURE
  syntax keyword glConstant EGL_MIPMAP_LEVEL

  " BindTexImage/ReleaseTexImage buffer target
  syntax keyword glConstant EGL_BACK_BUFFER
  syntax keyword glConstant EGL_SINGLE_BUFFER

  " Current surfaces
  syntax keyword glConstant EGL_DRAW
  syntax keyword glConstant EGL_READ

  " Engines
  syntax keyword glConstant EGL_CORE_NATIVE_ENGINE
  " }}}

  " Functions {{{
  syntax keyword glFunction eglGetError                                 

  syntax keyword glFunction eglGetDisplay                       
  syntax keyword glFunction eglInitialize                       
  syntax keyword glFunction eglTerminate                        

  syntax keyword glFunction eglQueryString                      

  syntax keyword glFunction eglGetConfigs                       
  syntax keyword glFunction eglChooseConfig                     
  syntax keyword glFunction eglGetConfigAttrib                  

  syntax keyword glFunction eglCreateWindowSurface      
  syntax keyword glFunction eglCreatePbufferSurface     
  syntax keyword glFunction eglCreatePixmapSurface      
  syntax keyword glFunction eglDestroySurface                   
  syntax keyword glFunction eglQuerySurface                     

  syntax keyword glFunction eglSurfaceAttrib                    
  syntax keyword glFunction eglBindTexImage                     
  syntax keyword glFunction eglReleaseTexImage                  

  syntax keyword glFunction eglSwapInterval                     

  syntax keyword glFunction eglCreateContext                    
  syntax keyword glFunction eglDestroyContext                   
  syntax keyword glFunction eglMakeCurrent                      

  syntax keyword glFunction eglGetCurrentContext        
  syntax keyword glFunction eglGetCurrentSurface        
  syntax keyword glFunction eglGetCurrentDisplay        
  syntax keyword glFunction eglQueryContext                     

  syntax keyword glFunction eglWaitGL                                   
  syntax keyword glFunction eglWaitNative                       
  syntax keyword glFunction eglSwapBuffers                      
  syntax keyword glFunction eglCopyBuffers                      

  syntax keyword glFunction eglGetProcAddress

  syntax keyword glFunction eglCreatePbufferFromClientBuffer
  syntax keyword glFunction eglWaitClient                       
  syntax keyword glFunction eglBindAPI                                  
  syntax keyword glFunction eglQueryAPI                                 
  syntax keyword glFunction eglReleaseThread                    
  " }}}
" }}}
endif

" Default highlighting
if version >= 508 || !exists("did_c_opengl_syntax_inits")
  if version < 508
    let did_c_opengl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink glType                Type
  HiLink glFunction            Function
  HiLink glConstant            Constant
  delcommand HiLink
endif

" vim: fdm=marker:
