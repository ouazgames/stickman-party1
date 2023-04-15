Shader "Hidden/InternalClear"
{
  Properties
  {
  }
  SubShader
  {
    Tags
    { 
    }
    Pass // ind: 1, name: 
    {
      Tags
      { 
      }
      ZTest Always
      ZWrite Off
      Cull Off
      ColorMask 0
      GpuProgramID 40659
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
      }
      Program "fp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
      }
      
    } // end phase
    Pass // ind: 2, name: 
    {
      Tags
      { 
      }
      ZTest Always
      ZWrite Off
      Cull Off
      GpuProgramID 113352
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
      }
      Program "fp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
      }
      
    } // end phase
    Pass // ind: 3, name: 
    {
      Tags
      { 
      }
      ZTest Always
      Cull Off
      ColorMask 0
      GpuProgramID 185454
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
      }
      Program "fp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
      }
      
    } // end phase
    Pass // ind: 4, name: 
    {
      Tags
      { 
      }
      ZTest Always
      Cull Off
      GpuProgramID 202167
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
      }
      Program "fp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
      }
      
    } // end phase
    Pass // ind: 5, name: 
    {
      Tags
      { 
      }
      ZTest Always
      ZWrite Off
      Cull Off
      Stencil
      { 
        Ref 0
        ReadMask 255
        WriteMask 255
        Pass Zero
        Fail Keep
        ZFail Keep
        PassFront Zero
        FailFront Keep
        ZFailFront Keep
        PassBack Zero
        FailBack Keep
        ZFailBack Keep
      } 
      ColorMask 0
      GpuProgramID 272253
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
      }
      Program "fp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
      }
      
    } // end phase
    Pass // ind: 6, name: 
    {
      Tags
      { 
      }
      ZTest Always
      ZWrite Off
      Cull Off
      Stencil
      { 
        Ref 0
        ReadMask 255
        WriteMask 255
        Pass Zero
        Fail Keep
        ZFail Keep
        PassFront Zero
        FailFront Keep
        ZFailFront Keep
        PassBack Zero
        FailBack Keep
        ZFailBack Keep
      } 
      GpuProgramID 346237
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
      }
      Program "fp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
      }
      
    } // end phase
    Pass // ind: 7, name: 
    {
      Tags
      { 
      }
      ZTest Always
      Cull Off
      Stencil
      { 
        Ref 0
        ReadMask 255
        WriteMask 255
        Pass Zero
        Fail Keep
        ZFail Keep
        PassFront Zero
        FailFront Keep
        ZFailFront Keep
        PassBack Zero
        FailBack Keep
        ZFailBack Keep
      } 
      ColorMask 0
      GpuProgramID 446987
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
      }
      Program "fp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
      }
      
    } // end phase
    Pass // ind: 8, name: 
    {
      Tags
      { 
      }
      ZTest Always
      Cull Off
      Stencil
      { 
        Ref 0
        ReadMask 255
        WriteMask 255
        Pass Zero
        Fail Keep
        ZFail Keep
        PassFront Zero
        FailFront Keep
        ZFailFront Keep
        PassBack Zero
        FailBack Keep
        ZFailBack Keep
      } 
      GpuProgramID 517744
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          uniform 	int unity_StereoEyeIndex;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
          ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
          ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
          ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }
          
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 100
          
          #ifdef GL_FRAGMENT_PRECISION_HIGH
              precision highp float;
          #else
              precision mediump float;
          #endif
          precision highp int;
          varying mediump vec4 vs_COLOR0;
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndex {
          	int unity_StereoEyeIndex;
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000A60200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D530000010006000800690000000000000090090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B546061100B1E0010050610100206104702002300470001234047000223C0010000021002220110002100473C000B004700010B014700020B03000002000E0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBB040E0208000000BC02020711B502022001CE02021012133E02021439150202BB04130200000000BB041302010000003E020207BB04131602000000BB041312030000003E080613393102063E02021339080806BB040E3201000000BC02020650CE02020706513E020352395302033E140307395E0403390A02013E040306C60602BD010003180201070E014D070201015523191A161718010702014A07020F0122130023190216171701070201010702144D07020101004A07020301010702194B07020201221A00231904161724010702010107021C4D07020101AA4A07020301010702214B070202012222000107022323190416172D010702014B07020401222700133308162401130201C418130201122204000107042F4D070201015501130208C0101302012323190216183B010702014A070205012207000113020D23190216183F01070201010702394D07020101004A070203010107020E4B07020201220F0001130215C0101302012423190216184801070201010702424D07020101AA4A07020301010702174B0702020122180001130C23C0101302012923190216185601070201010702504D07020101FF4A07020301010702254B07020201135E04541722000201070601220200236304541750010602013F0602012363025417502200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_AMD_vertex_shader_layer : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          float u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = float(uint(gl_InstanceID));
              u_xlat0 = u_xlat0 * 0.5;
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = u_xlat0 + u_xlat0;
              u_xlat0 = roundEven(u_xlat0);
              u_xlatu0 = uint(u_xlat0);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              gl_Layer = int(u_xlatu0);
              vs_BLENDINDICES0 = u_xlatu0;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          #extension GL_OVR_multiview2 : require
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          layout(std140) uniform UnityStereoGlobals {
          	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
          	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
          	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
          	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
          	vec3 unity_StereoWorldSpaceCameraPos[2];
          	vec4 unity_StereoScaleOffset[2];
          };
          layout(std140) uniform UnityStereoEyeIndices {
          	vec4 unity_StereoEyeIndices[2];
          };
          layout(num_views = 2) in;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
              vs_COLOR0 = in_COLOR0;
              u_xlatu0 = gl_ViewID_OVR;
              vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          in mediump vec4 vs_COLOR0;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vs_COLOR0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B2000000570200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005B0000000000000078080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485253100B1E0010050610100106104701002300470001234000000210022201100021004732000B004700010B014700020B03000002000C0010001E0000010010001E01000100930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E10030739500403390A02013E040306C60602A1010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201070601220200235504481644010602013F0602012355024816442200018D1E8806
          
          "
        }
      }
      Program "fp"
      {
        SubProgram "gles hw_tier00"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          
          
          "
        }
      }
      
    } // end phase
  }
  FallBack Off
}
