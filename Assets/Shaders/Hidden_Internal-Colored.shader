Shader "Hidden/Internal-Colored"
{
  Properties
  {
    _Color ("Color", Color) = (1,1,1,1)
    _SrcBlend ("SrcBlend", float) = 5
    _DstBlend ("DstBlend", float) = 10
    _ZWrite ("ZWrite", float) = 1
    _ZTest ("ZTest", float) = 4
    _Cull ("Cull", float) = 0
    _ZBias ("ZBias", float) = 0
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "QUEUE" = "Transparent"
      "RenderType" = "Transparent"
    }
    Pass // ind: 1, name: 
    {
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "QUEUE" = "Transparent"
        "RenderType" = "Transparent"
      }
      ZWrite Off
      Cull Off
      Blend Zero Zero
      GpuProgramID 18665
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
          uniform 	vec4 _Color;
          attribute highp vec4 in_POSITION0;
          attribute highp vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
          uniform 	vec4 _Color;
          attribute highp vec4 in_POSITION0;
          attribute highp vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
          uniform 	vec4 _Color;
          attribute highp vec4 in_POSITION0;
          attribute highp vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
          uniform 	vec4 _Color;
          in highp vec4 in_POSITION0;
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
          uniform 	vec4 _Color;
          in highp vec4 in_POSITION0;
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
          uniform 	vec4 _Color;
          in highp vec4 in_POSITION0;
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
          00000000B20000006D0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005F00000000000000CC080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1B1D50100B1E01100406101001061047010023004700012340470002238001000002100222011000210000080010001E0010021E004731000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBC0202070ECE02020F10073E02021139120202B502022001BB041402020000003E0202073E080307391A0203390A0401BB04140600000000BB04140201000000BB0414260300000039080806BB040D2801000000BC0202064CCE020207064D3E02034E394F02033E120306C60602A9010003180201070E011316161315010702014A07020D0122100001070613220100010704014D0702010155231606132021010702014A07020501221B00231602132020010702010107020A4D07020101004A07020301010702214B0702020122220023160213201501070201010702114D07020101AA4A07020301010702284B070202012229000107022A231604132034010702014B07020401222E00010704304D0702010155231602132121010702014A0702030122050023160213212001070201010702374D07020101004A070203010107020B4B07020201220C00231602132115010702010107023E4D07020101AA4A07020301010702124B0702020122130023160C132134010702010107024A4D07020101FF4A070203010107021E4B07020201131A02502022000123590450204C010602013F06020123590250204C2200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          00000000B20000006D0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005F00000000000000CC080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1B1D50100B1E01100406101001061047010023004700012340470002238001000002100222011000210000080010001E0010021E004731000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBC0202070ECE02020F10073E02021139120202B502022001BB041402020000003E0202073E080307391A0203390A0401BB04140600000000BB04140201000000BB0414260300000039080806BB040D2801000000BC0202064CCE020207064D3E02034E394F02033E120306C60602A9010003180201070E011316161315010702014A07020D0122100001070613220100010704014D0702010155231606132021010702014A07020501221B00231602132020010702010107020A4D07020101004A07020301010702214B0702020122220023160213201501070201010702114D07020101AA4A07020301010702284B070202012229000107022A231604132034010702014B07020401222E00010704304D0702010155231602132121010702014A0702030122050023160213212001070201010702374D07020101004A070203010107020B4B07020201220C00231602132115010702010107023E4D07020101AA4A07020301010702124B0702020122130023160C132134010702010107024A4D07020101FF4A070203010107021E4B07020201131A02502022000123590450204C010602013F06020123590250204C2200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          00000000B20000006D0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005F00000000000000CC080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1B1D50100B1E01100406101001061047010023004700012340470002238001000002100222011000210000080010001E0010021E004731000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBC0202070ECE02020F10073E02021139120202B502022001BB041402020000003E0202073E080307391A0203390A0401BB04140600000000BB04140201000000BB0414260300000039080806BB040D2801000000BC0202064CCE020207064D3E02034E394F02033E120306C60602A9010003180201070E011316161315010702014A07020D0122100001070613220100010704014D0702010155231606132021010702014A07020501221B00231602132020010702010107020A4D07020101004A07020301010702214B0702020122220023160213201501070201010702114D07020101AA4A07020301010702284B070202012229000107022A231604132034010702014B07020401222E00010704304D0702010155231602132121010702014A0702030122050023160213212001070201010702374D07020101004A070203010107020B4B07020201220C00231602132115010702010107023E4D07020101AA4A07020301010702124B0702020122130023160C132134010702010107024A4D07020101FF4A070203010107021E4B07020201131A02502022000123590450204C010602013F06020123590250204C2200018D1E8806
          
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
          uniform 	vec4 _Color;
          attribute highp vec4 in_POSITION0;
          attribute highp vec4 in_COLOR0;
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
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
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
          uniform 	vec4 _Color;
          attribute highp vec4 in_POSITION0;
          attribute highp vec4 in_COLOR0;
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
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
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
          uniform 	vec4 _Color;
          attribute highp vec4 in_POSITION0;
          attribute highp vec4 in_COLOR0;
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
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
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
          uniform 	vec4 _Color;
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
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
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
          uniform 	vec4 _Color;
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
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
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
          uniform 	vec4 _Color;
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
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          vec4 u_xlat0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(unity_StereoEyeIndex << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
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
          00000000B2000000BC0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008006D00000000000000E4090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1C1E5C100B1E0110040610100206104702002300470001234047000223C00147000323D001000002100222011000210000070010001E0010021E00473C000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBB040D0208000000BC02020710B502022001DE02020F1112073E02021339140202BB041202030000003E0202073E080307391B0203390A0401BB04120600000000BB04120201000000BB041216020000003E180612393902063E02021239080806BB040D3201000000BC02020658CE02020706593E02035A395B02033E160306C60602C5010003180201070E011317181516010702014A07020E0122110001070614220100010704014D0702010155231706152122010702014A07020501221C00231702152121010702010107020A4D07020101004A07020301010702224B0702020122230023170415212D01070201010702124D07020101AA4A070203010107022A4B07020201222B000107022C231702152116010702014B07020301222F00133B08152D01120201C41812020111220400010704374D070201015501120208C01012020121231702152243010702014A070205012207000112020D23170215224701070201010702414D07020101004A070203010107020E4B07020201220F0001120215C01012020123231702152250010702010107024A4D07020101AA4A07020301010702174B0702020122180001120C23C0101202014823170215225E01070201010702584D07020101FF4A07020301010702254B07020201131B025C212200012367045C2158010602013F0602012367025C21582200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000BC0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008006D00000000000000E4090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1C1E5C100B1E0110040610100206104702002300470001234047000223C00147000323D001000002100222011000210000070010001E0010021E00473C000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBB040D0208000000BC02020710B502022001DE02020F1112073E02021339140202BB041202030000003E0202073E080307391B0203390A0401BB04120600000000BB04120201000000BB041216020000003E180612393902063E02021239080806BB040D3201000000BC02020658CE02020706593E02035A395B02033E160306C60602C5010003180201070E011317181516010702014A07020E0122110001070614220100010704014D0702010155231706152122010702014A07020501221C00231702152121010702010107020A4D07020101004A07020301010702224B0702020122230023170415212D01070201010702124D07020101AA4A070203010107022A4B07020201222B000107022C231702152116010702014B07020301222F00133B08152D01120201C41812020111220400010704374D070201015501120208C01012020121231702152243010702014A070205012207000112020D23170215224701070201010702414D07020101004A070203010107020E4B07020201220F0001120215C01012020123231702152250010702010107024A4D07020101AA4A07020301010702174B0702020122180001120C23C0101202014823170215225E01070201010702584D07020101FF4A07020301010702254B07020201131B025C212200012367045C2158010602013F0602012367025C21582200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "UNITY_SINGLE_PASS_STEREO" }
          
          "!!vulkan
          00000000B2000000BC0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008006D00000000000000E4090000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1C1E5C100B1E0110040610100206104702002300470001234047000223C00147000323D001000002100222011000210000070010001E0010021E00473C000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBB040D0208000000BC02020710B502022001DE02020F1112073E02021339140202BB041202030000003E0202073E080307391B0203390A0401BB04120600000000BB04120201000000BB041216020000003E180612393902063E02021239080806BB040D3201000000BC02020658CE02020706593E02035A395B02033E160306C60602C5010003180201070E011317181516010702014A07020E0122110001070614220100010704014D0702010155231706152122010702014A07020501221C00231702152121010702010107020A4D07020101004A07020301010702224B0702020122230023170415212D01070201010702124D07020101AA4A070203010107022A4B07020201222B000107022C231702152116010702014B07020301222F00133B08152D01120201C41812020111220400010704374D070201015501120208C01012020121231702152243010702014A070205012207000112020D23170215224701070201010702414D07020101004A070203010107020E4B07020201220F0001120215C01012020123231702152250010702010107024A4D07020101AA4A07020301010702174B0702020122180001120C23C0101202014823170215225E01070201010702584D07020101FF4A07020301010702254B07020201131B025C212200012367045C2158010602013F0602012367025C21582200018D1E8806
          
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
          uniform 	vec4 _Color;
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
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          vec4 u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0.x = float(uint(gl_InstanceID));
              u_xlat0.x = u_xlat0.x * 0.5;
              u_xlat0.x = fract(u_xlat0.x);
              u_xlat0.x = u_xlat0.x + u_xlat0.x;
              u_xlat0.x = roundEven(u_xlat0.x);
              u_xlatu0 = uint(u_xlat0.x);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
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
          uniform 	vec4 _Color;
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
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          vec4 u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0.x = float(uint(gl_InstanceID));
              u_xlat0.x = u_xlat0.x * 0.5;
              u_xlat0.x = fract(u_xlat0.x);
              u_xlat0.x = u_xlat0.x + u_xlat0.x;
              u_xlat0.x = roundEven(u_xlat0.x);
              u_xlatu0 = uint(u_xlat0.x);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
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
          uniform 	vec4 _Color;
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
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          flat out highp uint vs_BLENDINDICES0;
          vec4 u_xlat0;
          uint u_xlatu0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          int u_xlati3;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0.x = float(uint(gl_InstanceID));
              u_xlat0.x = u_xlat0.x * 0.5;
              u_xlat0.x = fract(u_xlat0.x);
              u_xlat0.x = u_xlat0.x + u_xlat0.x;
              u_xlat0.x = roundEven(u_xlat0.x);
              u_xlatu0 = uint(u_xlat0.x);
              u_xlati3 = int(int(u_xlatu0) << 2);
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
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
          00000000B20000006D0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005F00000000000000CC080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1B1D50100B1E01100406101001061047010023004700012340470002238001000002100222011000210000080010001E0010021E004731000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBC0202070ECE02020F10073E02021139120202B502022001BB041402020000003E0202073E080307391A0203390A0401BB04140600000000BB04140201000000BB0414260300000039080806BB040D2801000000BC0202064CCE020207064D3E02034E394F02033E120306C60602A9010003180201070E011316161315010702014A07020D0122100001070613220100010704014D0702010155231606132021010702014A07020501221B00231602132020010702010107020A4D07020101004A07020301010702214B0702020122220023160213201501070201010702114D07020101AA4A07020301010702284B070202012229000107022A231604132034010702014B07020401222E00010704304D0702010155231602132121010702014A0702030122050023160213212001070201010702374D07020101004A070203010107020B4B07020201220C00231602132115010702010107023E4D07020101AA4A07020301010702124B0702020122130023160C132134010702010107024A4D07020101FF4A070203010107021E4B07020201131A02502022000123590450204C010602013F06020123590250204C2200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B20000006D0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005F00000000000000CC080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1B1D50100B1E01100406101001061047010023004700012340470002238001000002100222011000210000080010001E0010021E004731000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBC0202070ECE02020F10073E02021139120202B502022001BB041402020000003E0202073E080307391A0203390A0401BB04140600000000BB04140201000000BB0414260300000039080806BB040D2801000000BC0202064CCE020207064D3E02034E394F02033E120306C60602A9010003180201070E011316161315010702014A07020D0122100001070613220100010704014D0702010155231606132021010702014A07020501221B00231602132020010702010107020A4D07020101004A07020301010702214B0702020122220023160213201501070201010702114D07020101AA4A07020301010702284B070202012229000107022A231604132034010702014B07020401222E00010704304D0702010155231602132121010702014A0702030122050023160213212001070201010702374D07020101004A070203010107020B4B07020201220C00231602132115010702010107023E4D07020101AA4A07020301010702124B0702020122130023160C132134010702010107024A4D07020101FF4A070203010107021E4B07020201131A02502022000123590450204C010602013F06020123590250204C2200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_INSTANCING_ON" }
          
          "!!vulkan
          00000000B20000006D0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005F00000000000000CC080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1B1D50100B1E01100406101001061047010023004700012340470002238001000002100222011000210000080010001E0010021E004731000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBC0202070ECE02020F10073E02021139120202B502022001BB041402020000003E0202073E080307391A0203390A0401BB04140600000000BB04140201000000BB0414260300000039080806BB040D2801000000BC0202064CCE020207064D3E02034E394F02033E120306C60602A9010003180201070E011316161315010702014A07020D0122100001070613220100010704014D0702010155231606132021010702014A07020501221B00231602132020010702010107020A4D07020101004A07020301010702214B0702020122220023160213201501070201010702114D07020101AA4A07020301010702284B070202012229000107022A231604132034010702014B07020401222E00010704304D0702010155231602132121010702014A0702030122050023160213212001070201010702374D07020101004A070203010107020B4B07020201220C00231602132115010702010107023E4D07020101AA4A07020301010702124B0702020122130023160C132134010702010107024A4D07020101FF4A070203010107021E4B07020201131A02502022000123590450204C010602013F06020123590250204C2200018D1E8806
          
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
          uniform 	vec4 _Color;
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
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
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
          uniform 	vec4 _Color;
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
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
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
          uniform 	vec4 _Color;
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
          in highp vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out highp float vs_BLENDWEIGHT0;
          vec4 u_xlat0;
          uint u_xlatu0;
          int u_xlati1;
          vec4 u_xlat2;
          void main()
          {
              u_xlat0 = in_COLOR0 * _Color;
              vs_COLOR0 = u_xlat0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlati1 = int(int(gl_ViewID_OVR) << 2);
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
              u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
              gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
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
          00000000B20000006D0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005F00000000000000CC080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1B1D50100B1E01100406101001061047010023004700012340470002238001000002100222011000210000080010001E0010021E004731000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBC0202070ECE02020F10073E02021139120202B502022001BB041402020000003E0202073E080307391A0203390A0401BB04140600000000BB04140201000000BB0414260300000039080806BB040D2801000000BC0202064CCE020207064D3E02034E394F02033E120306C60602A9010003180201070E011316161315010702014A07020D0122100001070613220100010704014D0702010155231606132021010702014A07020501221B00231602132020010702010107020A4D07020101004A07020301010702214B0702020122220023160213201501070201010702114D07020101AA4A07020301010702284B070202012229000107022A231604132034010702014B07020401222E00010704304D0702010155231602132121010702014A0702030122050023160213212001070201010702374D07020101004A070203010107020B4B07020201220C00231602132115010702010107023E4D07020101AA4A07020301010702124B0702020122130023160C132134010702010107024A4D07020101FF4A070203010107021E4B07020201131A02502022000123590450204C010602013F06020123590250204C2200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B20000006D0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005F00000000000000CC080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1B1D50100B1E01100406101001061047010023004700012340470002238001000002100222011000210000080010001E0010021E004731000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBC0202070ECE02020F10073E02021139120202B502022001BB041402020000003E0202073E080307391A0203390A0401BB04140600000000BB04140201000000BB0414260300000039080806BB040D2801000000BC0202064CCE020207064D3E02034E394F02033E120306C60602A9010003180201070E011316161315010702014A07020D0122100001070613220100010704014D0702010155231606132021010702014A07020501221B00231602132020010702010107020A4D07020101004A07020301010702214B0702020122220023160213201501070201010702114D07020101AA4A07020301010702284B070202012229000107022A231604132034010702014B07020401222E00010704304D0702010155231602132121010702014A0702030122050023160213212001070201010702374D07020101004A070203010107020B4B07020201220C00231602132115010702010107023E4D07020101AA4A07020301010702124B0702020122130023160C132134010702010107024A4D07020101FF4A070203010107021E4B07020201131A02502022000123590450204C010602013F06020123590250204C2200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
           Keywords { "STEREO_MULTIVIEW_ON" }
          
          "!!vulkan
          00000000B20000006D0200002C000000860000000000000000000000000000000000000000000000000000004C4F4D5300000100060008000E000000000000005C010000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600090BA002040700090010001E0000020010001E00000100930202A1040202A6020620B7020206043E020307390802033E020107390A0201C606020D0003180201070E012203008D1E88064C4F4D5300000100060008005F00000000000000CC080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B1B1D50100B1E01100406101001061047010023004700012340470002238001000002100222011000210000080010001E0010021E004731000B004700010B014700020B03000002930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502042000BB040D0204000000BC0202070EBC0202070ECE02020F10073E02021139120202B502022001BB041402020000003E0202073E080307391A0203390A0401BB04140600000000BB04140201000000BB0414260300000039080806BB040D2801000000BC0202064CCE020207064D3E02034E394F02033E120306C60602A9010003180201070E011316161315010702014A07020D0122100001070613220100010704014D0702010155231606132021010702014A07020501221B00231602132020010702010107020A4D07020101004A07020301010702214B0702020122220023160213201501070201010702114D07020101AA4A07020301010702284B070202012229000107022A231604132034010702014B07020401222E00010704304D0702010155231602132121010702014A0702030122050023160213212001070201010702374D07020101004A070203010107020B4B07020201220C00231602132115010702010107023E4D07020101AA4A07020301010702124B0702020122130023160C132134010702010107024A4D07020101FF4A070203010107021E4B07020201131A02502022000123590450204C010602013F06020123590250204C2200018D1E8806
          
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
