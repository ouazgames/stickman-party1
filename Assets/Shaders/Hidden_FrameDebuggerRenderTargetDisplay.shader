Shader "Hidden/FrameDebuggerRenderTargetDisplay"
{
  Properties
  {
    _MainTex ("", any) = "white" {}
  }
  SubShader
  {
    Tags
    { 
      "ForceSupported" = "true"
    }
    Pass // ind: 1, name: 
    {
      Tags
      { 
        "ForceSupported" = "true"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      GpuProgramID 555
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
          attribute highp vec3 in_TEXCOORD0;
          varying highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp sampler2D _MainTex;
          varying highp vec3 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlatb2 = u_xlat16_4==1.0;
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          attribute highp vec3 in_TEXCOORD0;
          varying highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp sampler2D _MainTex;
          varying highp vec3 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlatb2 = u_xlat16_4==1.0;
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          attribute highp vec3 in_TEXCOORD0;
          varying highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp sampler2D _MainTex;
          varying highp vec3 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlatb2 = u_xlat16_4==1.0;
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          in highp vec3 in_TEXCOORD0;
          out highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp sampler2D _MainTex;
          in highp vec3 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
          #ifdef UNITY_ADRENO_ES3
              u_xlatb2 = !!(u_xlat16_4==1.0);
          #else
              u_xlatb2 = u_xlat16_4==1.0;
          #endif
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
          #else
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
          #endif
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          in highp vec3 in_TEXCOORD0;
          out highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp sampler2D _MainTex;
          in highp vec3 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
          #ifdef UNITY_ADRENO_ES3
              u_xlatb2 = !!(u_xlat16_4==1.0);
          #else
              u_xlatb2 = u_xlat16_4==1.0;
          #endif
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
          #else
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
          #endif
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          in highp vec3 in_TEXCOORD0;
          out highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp sampler2D _MainTex;
          in highp vec3 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
          #ifdef UNITY_ADRENO_ES3
              u_xlatb2 = !!(u_xlat16_4==1.0);
          #else
              u_xlatb2 = u_xlat16_4==1.0;
          #endif
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
          #else
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
          #endif
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          000000003C040000700200002C000000100400000000000000000000000000000000000000000000000000004C4F4D5300000100060008008800000000000000280E0000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F306001671A0020407551600000076735F544558434F4F52443000000000100C220010002101100422001000210010061E000005003703000047000023003700010047000123104700022320000002100222011000210000040000010000010000030000050000010000030000010000030000010000010000010000010000030000010000010000030000020000020000010000040000070000010000020000010000010000010000010000020000010000010000010000010000030000030000010000010000010000030000020000010000010000020010001E00000C00000100000600930202A1040202A6020620B7020206043E02060739080206890302060100000001003E02000A390B02009A02043E02000E390F0200AB02040AB7020406033E02011439150201B70202060239080806B502042001CE020207071D3E02021E391F0202BB041D02010000003E0202073E0C061439280206B502022000BB042A02000000003E020206BB042A08010000003E080606BB041D0E00000000BB04060A0000803FEC04070201010101393406069402083E020648394902063E080707BB0406180000000039280806BB04060412519C3EDC041402010101BB040604C4A22E3FDC041402010101BB04060AC22C4D3CDC041402010101392804063E08030739700203BB041D02020000003E02021D3E080714BB042A16030000003E060306C60602810200031802394E94010739775207010AD50101010E0801C60A12040D0000001100000001140A022D1702010110C70A070207012211000107041313220E2021010702014D07020101003F0702014B07020B01220C00232C0C20212B010602013F060201232C04202130010602014B06020401133404292B2200020107021B0114020E4D0702010100C81007020301221E000107021F132204203B010702014A0702040122230001070224C41206060301133402292B220001132204203B01070201C4120602010622030001060807C4164802010C22020001480203A71E0700BA1E00050D1806011404294D0702010100220400991E0418020107023A220600991E08180701070A07223B000107023C3D1402010118222F0001140230D00A1404010101D00A14021C1C1C7C1402012B595B5C223400011404364A140603014B140603012207000114023D011402094A140202014B14060301220D0001140444011402104A1402020122030013730A2072011D0201CB144802013BA71E0700BA1E00050B18060114040F220300991E021802010702623D1402010118220600991E08180701140A070107020F4407020102040506032210001334041B820101060201138501047182012200028D1E88064C4F4D5300000100060008005E000000000000009C080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485456555400000076735F544558434F4F52443000000000100B1E0010050610100106104701002300470001234000000210022201100021014732000B004700010B014700020B03000002100E1E0010021E01930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E100307B7020406033E020352395302033E020152395502013E040306C60602A7010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201520C01220300235804481644010602013F0602012358024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          000000003C040000700200002C000000100400000000000000000000000000000000000000000000000000004C4F4D5300000100060008008800000000000000280E0000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F306001671A0020407551600000076735F544558434F4F52443000000000100C220010002101100422001000210010061E000005003703000047000023003700010047000123104700022320000002100222011000210000040000010000010000030000050000010000030000010000030000010000010000010000010000030000010000010000030000020000020000010000040000070000010000020000010000010000010000010000020000010000010000010000010000030000030000010000010000010000030000020000010000010000020010001E00000C00000100000600930202A1040202A6020620B7020206043E02060739080206890302060100000001003E02000A390B02009A02043E02000E390F0200AB02040AB7020406033E02011439150201B70202060239080806B502042001CE020207071D3E02021E391F0202BB041D02010000003E0202073E0C061439280206B502022000BB042A02000000003E020206BB042A08010000003E080606BB041D0E00000000BB04060A0000803FEC04070201010101393406069402083E020648394902063E080707BB0406180000000039280806BB04060412519C3EDC041402010101BB040604C4A22E3FDC041402010101BB04060AC22C4D3CDC041402010101392804063E08030739700203BB041D02020000003E02021D3E080714BB042A16030000003E060306C60602810200031802394E94010739775207010AD50101010E0801C60A12040D0000001100000001140A022D1702010110C70A070207012211000107041313220E2021010702014D07020101003F0702014B07020B01220C00232C0C20212B010602013F060201232C04202130010602014B06020401133404292B2200020107021B0114020E4D0702010100C81007020301221E000107021F132204203B010702014A0702040122230001070224C41206060301133402292B220001132204203B01070201C4120602010622030001060807C4164802010C22020001480203A71E0700BA1E00050D1806011404294D0702010100220400991E0418020107023A220600991E08180701070A07223B000107023C3D1402010118222F0001140230D00A1404010101D00A14021C1C1C7C1402012B595B5C223400011404364A140603014B140603012207000114023D011402094A140202014B14060301220D0001140444011402104A1402020122030013730A2072011D0201CB144802013BA71E0700BA1E00050B18060114040F220300991E021802010702623D1402010118220600991E08180701140A070107020F4407020102040506032210001334041B820101060201138501047182012200028D1E88064C4F4D5300000100060008005E000000000000009C080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485456555400000076735F544558434F4F52443000000000100B1E0010050610100106104701002300470001234000000210022201100021014732000B004700010B014700020B03000002100E1E0010021E01930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E100307B7020406033E020352395302033E020152395502013E040306C60602A7010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201520C01220300235804481644010602013F0602012358024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          000000003C040000700200002C000000100400000000000000000000000000000000000000000000000000004C4F4D5300000100060008008800000000000000280E0000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F306001671A0020407551600000076735F544558434F4F52443000000000100C220010002101100422001000210010061E000005003703000047000023003700010047000123104700022320000002100222011000210000040000010000010000030000050000010000030000010000030000010000010000010000010000030000010000010000030000020000020000010000040000070000010000020000010000010000010000010000020000010000010000010000010000030000030000010000010000010000030000020000010000010000020010001E00000C00000100000600930202A1040202A6020620B7020206043E02060739080206890302060100000001003E02000A390B02009A02043E02000E390F0200AB02040AB7020406033E02011439150201B70202060239080806B502042001CE020207071D3E02021E391F0202BB041D02010000003E0202073E0C061439280206B502022000BB042A02000000003E020206BB042A08010000003E080606BB041D0E00000000BB04060A0000803FEC04070201010101393406069402083E020648394902063E080707BB0406180000000039280806BB04060412519C3EDC041402010101BB040604C4A22E3FDC041402010101BB04060AC22C4D3CDC041402010101392804063E08030739700203BB041D02020000003E02021D3E080714BB042A16030000003E060306C60602810200031802394E94010739775207010AD50101010E0801C60A12040D0000001100000001140A022D1702010110C70A070207012211000107041313220E2021010702014D07020101003F0702014B07020B01220C00232C0C20212B010602013F060201232C04202130010602014B06020401133404292B2200020107021B0114020E4D0702010100C81007020301221E000107021F132204203B010702014A0702040122230001070224C41206060301133402292B220001132204203B01070201C4120602010622030001060807C4164802010C22020001480203A71E0700BA1E00050D1806011404294D0702010100220400991E0418020107023A220600991E08180701070A07223B000107023C3D1402010118222F0001140230D00A1404010101D00A14021C1C1C7C1402012B595B5C223400011404364A140603014B140603012207000114023D011402094A140202014B14060301220D0001140444011402104A1402020122030013730A2072011D0201CB144802013BA71E0700BA1E00050B18060114040F220300991E021802010702623D1402010118220600991E08180701140A070107020F4407020102040506032210001334041B820101060201138501047182012200028D1E88064C4F4D5300000100060008005E000000000000009C080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485456555400000076735F544558434F4F52443000000000100B1E0010050610100106104701002300470001234000000210022201100021014732000B004700010B014700020B03000002100E1E0010021E01930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E100307B7020406033E020352395302033E020152395502013E040306C60602A7010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201520C01220300235804481644010602013F0602012358024816442200018D1E8806
          
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
      }
      
    } // end phase
    Pass // ind: 2, name: 
    {
      Tags
      { 
        "ForceSupported" = "true"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      GpuProgramID 97613
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
          attribute highp vec3 in_TEXCOORD0;
          varying highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp samplerCube _MainTex;
          varying highp vec3 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = textureCube(_MainTex, vs_TEXCOORD0.xyz);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlatb2 = u_xlat16_4==1.0;
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          attribute highp vec3 in_TEXCOORD0;
          varying highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp samplerCube _MainTex;
          varying highp vec3 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = textureCube(_MainTex, vs_TEXCOORD0.xyz);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlatb2 = u_xlat16_4==1.0;
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          attribute highp vec3 in_TEXCOORD0;
          varying highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp samplerCube _MainTex;
          varying highp vec3 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = textureCube(_MainTex, vs_TEXCOORD0.xyz);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlatb2 = u_xlat16_4==1.0;
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          in highp vec3 in_TEXCOORD0;
          out highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp samplerCube _MainTex;
          in highp vec3 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xyz);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
          #ifdef UNITY_ADRENO_ES3
              u_xlatb2 = !!(u_xlat16_4==1.0);
          #else
              u_xlatb2 = u_xlat16_4==1.0;
          #endif
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
          #else
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
          #endif
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          in highp vec3 in_TEXCOORD0;
          out highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp samplerCube _MainTex;
          in highp vec3 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xyz);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
          #ifdef UNITY_ADRENO_ES3
              u_xlatb2 = !!(u_xlat16_4==1.0);
          #else
              u_xlatb2 = u_xlat16_4==1.0;
          #endif
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
          #else
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
          #endif
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          in highp vec3 in_TEXCOORD0;
          out highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform highp samplerCube _MainTex;
          in highp vec3 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec4 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xyz);
              u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
          #ifdef UNITY_ADRENO_ES3
              u_xlatb2 = !!(u_xlat16_4==1.0);
          #else
              u_xlatb2 = u_xlat16_4==1.0;
          #endif
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
          #else
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
          #endif
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          0000000031040000700200002C000000050400000000000000000000000000000000000000000000000000004C4F4D5300000100060008008600000000000000FC0D0000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600166FA0020407551600000076735F544558434F4F52443000000000100C220010002101100422001000210010061E000003003703000047000023003700010047000123104700022320000002100222011000210000040000010000010000030000050000010000030000010000030000010000010000010000010000030000010000010000030000020000020000010000040000070000010000020000010000010000010000010000020000010000010000010000010000030000030000010000010000010000030000020000010000010000020010001E00000C00000100000600930202A1040202A6020620B7020206043E02060739080206890302060300000001003E02000A390B02009A02043E02000E390F0200AB02040AB7020406033E0201143915020139080606B502042001CE020207071B3E02021C391D0202BB041B02010000003E0202073E0C061439260206B502022000BB042802000000003E020206BB042808010000003E080606BB041B0E00000000BB04060A0000803FEC04070201010101393206069402083E020646394702063E080707BB0406180000000039260806BB04060412519C3EDC041402010101BB040604C4A22E3FDC041402010101BB04060AC22C4D3CDC041402010101392604063E080307396E0203BB041B02020000003E02021B3E080714BB042816030000003E060306C60602FD0100031802394C90010739755207010AD10101010E0801C60A12040D0000001100000001140801C70A07020501220F000107041113200E1E1F010702014D07020101003F0702014B07020B01220C00232A0C1E1F29010602013F060201232A041E1F2E010602014B0602040113320427292200020107021B0114020E4D0702010100C81007020301221E000107021F1320041E39010702014A0702040122230001070224C4120606030113320227292200011320041E3901070201C4120602010622030001060807C4164602010C22020001460203A71E0700BA1E00050D1806011404294D0702010100220400991E0418020107023A220600991E08180701070A07223B000107023C3D1402010118222F0001140230D00A1404010101D00A14021C1C1C7C1402012B57595A223400011404364A140603014B140603012207000114023D011402094A140202014B14060301220D0001140444011402104A1402020122030013710A1E70011B0201CB144602013BA71E0700BA1E00050B18060114040F220300991E021802010702623D1402010118220600991E08180701140A070107020F44070201020405060322100013320419800101060201138301046F80012200028D1E88064C4F4D5300000100060008005E000000000000009C080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485456555400000076735F544558434F4F52443000000000100B1E0010050610100106104701002300470001234000000210022201100021014732000B004700010B014700020B03000002100E1E0010021E01930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E100307B7020406033E020352395302033E020152395502013E040306C60602A7010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201520C01220300235804481644010602013F0602012358024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          0000000031040000700200002C000000050400000000000000000000000000000000000000000000000000004C4F4D5300000100060008008600000000000000FC0D0000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600166FA0020407551600000076735F544558434F4F52443000000000100C220010002101100422001000210010061E000003003703000047000023003700010047000123104700022320000002100222011000210000040000010000010000030000050000010000030000010000030000010000010000010000010000030000010000010000030000020000020000010000040000070000010000020000010000010000010000010000020000010000010000010000010000030000030000010000010000010000030000020000010000010000020010001E00000C00000100000600930202A1040202A6020620B7020206043E02060739080206890302060300000001003E02000A390B02009A02043E02000E390F0200AB02040AB7020406033E0201143915020139080606B502042001CE020207071B3E02021C391D0202BB041B02010000003E0202073E0C061439260206B502022000BB042802000000003E020206BB042808010000003E080606BB041B0E00000000BB04060A0000803FEC04070201010101393206069402083E020646394702063E080707BB0406180000000039260806BB04060412519C3EDC041402010101BB040604C4A22E3FDC041402010101BB04060AC22C4D3CDC041402010101392604063E080307396E0203BB041B02020000003E02021B3E080714BB042816030000003E060306C60602FD0100031802394C90010739755207010AD10101010E0801C60A12040D0000001100000001140801C70A07020501220F000107041113200E1E1F010702014D07020101003F0702014B07020B01220C00232A0C1E1F29010602013F060201232A041E1F2E010602014B0602040113320427292200020107021B0114020E4D0702010100C81007020301221E000107021F1320041E39010702014A0702040122230001070224C4120606030113320227292200011320041E3901070201C4120602010622030001060807C4164602010C22020001460203A71E0700BA1E00050D1806011404294D0702010100220400991E0418020107023A220600991E08180701070A07223B000107023C3D1402010118222F0001140230D00A1404010101D00A14021C1C1C7C1402012B57595A223400011404364A140603014B140603012207000114023D011402094A140202014B14060301220D0001140444011402104A1402020122030013710A1E70011B0201CB144602013BA71E0700BA1E00050B18060114040F220300991E021802010702623D1402010118220600991E08180701140A070107020F44070201020405060322100013320419800101060201138301046F80012200028D1E88064C4F4D5300000100060008005E000000000000009C080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485456555400000076735F544558434F4F52443000000000100B1E0010050610100106104701002300470001234000000210022201100021014732000B004700010B014700020B03000002100E1E0010021E01930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E100307B7020406033E020352395302033E020152395502013E040306C60602A7010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201520C01220300235804481644010602013F0602012358024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          0000000031040000700200002C000000050400000000000000000000000000000000000000000000000000004C4F4D5300000100060008008600000000000000FC0D0000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600166FA0020407551600000076735F544558434F4F52443000000000100C220010002101100422001000210010061E000003003703000047000023003700010047000123104700022320000002100222011000210000040000010000010000030000050000010000030000010000030000010000010000010000010000030000010000010000030000020000020000010000040000070000010000020000010000010000010000010000020000010000010000010000010000030000030000010000010000010000030000020000010000010000020010001E00000C00000100000600930202A1040202A6020620B7020206043E02060739080206890302060300000001003E02000A390B02009A02043E02000E390F0200AB02040AB7020406033E0201143915020139080606B502042001CE020207071B3E02021C391D0202BB041B02010000003E0202073E0C061439260206B502022000BB042802000000003E020206BB042808010000003E080606BB041B0E00000000BB04060A0000803FEC04070201010101393206069402083E020646394702063E080707BB0406180000000039260806BB04060412519C3EDC041402010101BB040604C4A22E3FDC041402010101BB04060AC22C4D3CDC041402010101392604063E080307396E0203BB041B02020000003E02021B3E080714BB042816030000003E060306C60602FD0100031802394C90010739755207010AD10101010E0801C60A12040D0000001100000001140801C70A07020501220F000107041113200E1E1F010702014D07020101003F0702014B07020B01220C00232A0C1E1F29010602013F060201232A041E1F2E010602014B0602040113320427292200020107021B0114020E4D0702010100C81007020301221E000107021F1320041E39010702014A0702040122230001070224C4120606030113320227292200011320041E3901070201C4120602010622030001060807C4164602010C22020001460203A71E0700BA1E00050D1806011404294D0702010100220400991E0418020107023A220600991E08180701070A07223B000107023C3D1402010118222F0001140230D00A1404010101D00A14021C1C1C7C1402012B57595A223400011404364A140603014B140603012207000114023D011402094A140202014B14060301220D0001140444011402104A1402020122030013710A1E70011B0201CB144602013BA71E0700BA1E00050B18060114040F220300991E021802010702623D1402010118220600991E08180701140A070107020F44070201020405060322100013320419800101060201138301046F80012200028D1E88064C4F4D5300000100060008005E000000000000009C080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485456555400000076735F544558434F4F52443000000000100B1E0010050610100106104701002300470001234000000210022201100021014732000B004700010B014700020B03000002100E1E0010021E01930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E100307B7020406033E020352395302033E020152395502013E040306C60602A7010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201520C01220300235804481644010602013F0602012358024816442200018D1E8806
          
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
      }
      
    } // end phase
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
      GpuProgramID 154055
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles3 hw_tier00"
        {
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in highp vec3 in_TEXCOORD0;
          out highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform mediump sampler2DArray _MainTex;
          in highp vec3 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
              u_xlat16_0 = u_xlat16_0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
          #ifdef UNITY_ADRENO_ES3
              u_xlatb2 = !!(u_xlat16_4==1.0);
          #else
              u_xlatb2 = u_xlat16_4==1.0;
          #endif
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
          #else
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
          #endif
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          in highp vec3 in_TEXCOORD0;
          out highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform mediump sampler2DArray _MainTex;
          in highp vec3 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
              u_xlat16_0 = u_xlat16_0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
          #ifdef UNITY_ADRENO_ES3
              u_xlatb2 = !!(u_xlat16_4==1.0);
          #else
              u_xlatb2 = u_xlat16_4==1.0;
          #endif
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
          #else
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
          #endif
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
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
          in highp vec3 in_TEXCOORD0;
          out highp vec3 vs_TEXCOORD0;
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
              vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Channels;
          uniform 	mediump vec4 _Levels;
          uniform 	int _UndoOutputSRGB;
          uniform mediump sampler2DArray _MainTex;
          in highp vec3 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          vec3 u_xlat2;
          mediump vec3 u_xlat16_2;
          bool u_xlatb2;
          mediump float u_xlat16_4;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
              u_xlat16_0 = u_xlat16_0 + (-_Levels.xxxx);
              u_xlat16_1.x = (-_Levels.x) + _Levels.y;
              u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
              u_xlat16_0 = u_xlat16_0 * _Channels;
              u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
              u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
          #ifdef UNITY_ADRENO_ES3
              u_xlatb2 = !!(u_xlat16_4==1.0);
          #else
              u_xlatb2 = u_xlat16_4==1.0;
          #endif
              u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
              u_xlat16_1.xyz = u_xlat16_0.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
          #else
              u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
          #endif
              u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
              u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
              u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
              SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
              SV_Target0.w = u_xlat16_0.w;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "vulkan hw_tier00"
        {
          
          "!!vulkan
          0000000046040000700200002C0000001A0400000000000000000000000000000000000000000000000000004C4F4D5300000100060008008600000000000000500E0000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600166FA0020407551600000076735F544558434F4F524430000000000009000003001000220010002101000100000300100022001000210000010010051E000003000001003702000047000023003700010047000123104700022320000002100222011000210000040000010000010000010000020000050000010000030000010000030000010000010000010000010000030000010000010000030000020000020000010000040000070000010000020000010000010000010000010000020000010000010000010000010000030000030000010000010000010000030000020000010000010000020010001E00000C00000100000600930202A1040202A6020620B7020206043E02060739080206890302060100010001003E02000A390B02009A02043E02000E390F0200AB02040AB7020406033E0201143915020139080606B502042001CE020207071B3E02021C391D0202BB041B02010000003E0202073E0C061439260206B502022000BB042802000000003E020206BB042808010000003E080606BB041B0E00000000BB04060A0000803FEC04070201010101393206069402083E020646394702063E080707BB0406180000000039260806BB04060412519C3EDC041402010101BB040604C4A22E3FDC041402010101BB04060AC22C4D3CDC041402010101392604063E080307396E0203BB041B02020000003E02021B3E080714BB042816030000003E060306C60602FD0100031802394C90010739755207010AD10101010E0801C60A12040D0000001100000001140801C70A07020501220F000107041113200E1E1F010702014D07020101003F0702014B07020B01220C00232A0C1E1F29010602013F060201232A041E1F2E010602014B0602040113320427292200020107021B0114020E4D0702010100C81007020301221E000107021F1320041E39010702014A0702040122230001070224C4120606030113320227292200011320041E3901070201C4120602010622030001060807C4164602010C22020001460203A71E0700BA1E00050D1806011404294D0702010100220400991E0418020107023A220600991E08180701070A07223B000107023C3D1402010118222F0001140230D00A1404010101D00A14021C1C1C7C1402012B57595A223400011404364A140603014B140603012207000114023D011402094A140202014B14060301220D0001140444011402104A1402020122030013710A1E70011B0201CB144602013BA71E0700BA1E00050B18060114040F220300991E021802010702623D1402010118220600991E08180701140A070107020F44070201020405060322100013320419800101060201138301046F80012200028D1E88064C4F4D5300000100060008005E000000000000009C080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485456555400000076735F544558434F4F52443000000000100B1E0010050610100106104701002300470001234000000210022201100021014732000B004700010B014700020B03000002100E1E0010021E01930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E100307B7020406033E020352395302033E020152395502013E040306C60602A7010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201520C01220300235804481644010602013F0602012358024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier01"
        {
          
          "!!vulkan
          0000000046040000700200002C0000001A0400000000000000000000000000000000000000000000000000004C4F4D5300000100060008008600000000000000500E0000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600166FA0020407551600000076735F544558434F4F524430000000000009000003001000220010002101000100000300100022001000210000010010051E000003000001003702000047000023003700010047000123104700022320000002100222011000210000040000010000010000010000020000050000010000030000010000030000010000010000010000010000030000010000010000030000020000020000010000040000070000010000020000010000010000010000010000020000010000010000010000010000030000030000010000010000010000030000020000010000010000020010001E00000C00000100000600930202A1040202A6020620B7020206043E02060739080206890302060100010001003E02000A390B02009A02043E02000E390F0200AB02040AB7020406033E0201143915020139080606B502042001CE020207071B3E02021C391D0202BB041B02010000003E0202073E0C061439260206B502022000BB042802000000003E020206BB042808010000003E080606BB041B0E00000000BB04060A0000803FEC04070201010101393206069402083E020646394702063E080707BB0406180000000039260806BB04060412519C3EDC041402010101BB040604C4A22E3FDC041402010101BB04060AC22C4D3CDC041402010101392604063E080307396E0203BB041B02020000003E02021B3E080714BB042816030000003E060306C60602FD0100031802394C90010739755207010AD10101010E0801C60A12040D0000001100000001140801C70A07020501220F000107041113200E1E1F010702014D07020101003F0702014B07020B01220C00232A0C1E1F29010602013F060201232A041E1F2E010602014B0602040113320427292200020107021B0114020E4D0702010100C81007020301221E000107021F1320041E39010702014A0702040122230001070224C4120606030113320227292200011320041E3901070201C4120602010622030001060807C4164602010C22020001460203A71E0700BA1E00050D1806011404294D0702010100220400991E0418020107023A220600991E08180701070A07223B000107023C3D1402010118222F0001140230D00A1404010101D00A14021C1C1C7C1402012B57595A223400011404364A140603014B140603012207000114023D011402094A140202014B14060301220D0001140444011402104A1402020122030013710A1E70011B0201CB144602013BA71E0700BA1E00050B18060114040F220300991E021802010702623D1402010118220600991E08180701140A070107020F44070201020405060322100013320419800101060201138301046F80012200028D1E88064C4F4D5300000100060008005E000000000000009C080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485456555400000076735F544558434F4F52443000000000100B1E0010050610100106104701002300470001234000000210022201100021014732000B004700010B014700020B03000002100E1E0010021E01930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E100307B7020406033E020352395302033E020152395502013E040306C60602A7010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201520C01220300235804481644010602013F0602012358024816442200018D1E8806
          
          "
        }
        SubProgram "vulkan hw_tier02"
        {
          
          "!!vulkan
          0000000046040000700200002C0000001A0400000000000000000000000000000000000000000000000000004C4F4D5300000100060008008600000000000000500E0000910201D11002474C534C2E7374642E34353000000000A0040001EF0E0404EDC2A5F30600166FA0020407551600000076735F544558434F4F524430000000000009000003001000220010002101000100000300100022001000210000010010051E000003000001003702000047000023003700010047000123104700022320000002100222011000210000040000010000010000010000020000050000010000030000010000030000010000010000010000010000030000010000010000030000020000020000010000040000070000010000020000010000010000010000010000020000010000010000010000010000030000030000010000010000010000030000020000010000010000020010001E00000C00000100000600930202A1040202A6020620B7020206043E02060739080206890302060100010001003E02000A390B02009A02043E02000E390F0200AB02040AB7020406033E0201143915020139080606B502042001CE020207071B3E02021C391D0202BB041B02010000003E0202073E0C061439260206B502022000BB042802000000003E020206BB042808010000003E080606BB041B0E00000000BB04060A0000803FEC04070201010101393206069402083E020646394702063E080707BB0406180000000039260806BB04060412519C3EDC041402010101BB040604C4A22E3FDC041402010101BB04060AC22C4D3CDC041402010101392604063E080307396E0203BB041B02020000003E02021B3E080714BB042816030000003E060306C60602FD0100031802394C90010739755207010AD10101010E0801C60A12040D0000001100000001140801C70A07020501220F000107041113200E1E1F010702014D07020101003F0702014B07020B01220C00232A0C1E1F29010602013F060201232A041E1F2E010602014B0602040113320427292200020107021B0114020E4D0702010100C81007020301221E000107021F1320041E39010702014A0702040122230001070224C4120606030113320227292200011320041E3901070201C4120602010622030001060807C4164602010C22020001460203A71E0700BA1E00050D1806011404294D0702010100220400991E0418020107023A220600991E08180701070A07223B000107023C3D1402010118222F0001140230D00A1404010101D00A14021C1C1C7C1402012B57595A223400011404364A140603014B140603012207000114023D011402094A140202014B14060301220D0001140444011402104A1402020122030013710A1E70011B0201CB144602013BA71E0700BA1E00050B18060114040F220300991E021802010702623D1402010118220600991E08180701140A070107020F44070201020405060322100013320419800101060201138301046F80012200028D1E88064C4F4D5300000100060008005E000000000000009C080000910201D11002474C534C2E7374642E34353000000000A00400018F0F0004EDC2A5F306000B485456555400000076735F544558434F4F52443000000000100B1E0010050610100106104701002300470001234000000210022201100021014732000B004700010B014700020B03000002100E1E0010021E01930202A1040202A6020620B7020206043E020607390802063E020107390A0201B502062000BB040E0204000000BC0202070FBC0202070FBE020210113E02021239130202B502022001BB04150200000000BB041502010000003E020207BB04151602000000BB0415120300000039080806BB040E2801000000BC02020644CE02020706453E020346394702033E100307B7020406033E020352395302033E020152395502013E040306C60602A7010003180201070E014D0702010155231818141617010702014A07020E0122120023180214161601070201010702134D07020101004A07020301010702184B07020201221900231804141623010702010107021B4D07020101AA4A07020301010702204B070202012221000107022223180414162C010702014B07020401222600010704284D0702010155231802141717010702014A07020301220500231802141716010702010107022F4D07020101004A070203010107020B4B07020201220C0023180214172301070201010702364D07020101AA4A07020301010702124B0702020122130023180C14172C01070201010702424D07020101FF4A070203010107021E4B07020201135004481622000201520C01220300235804481644010602013F0602012358024816442200018D1E8806
          
          "
        }
      }
      Program "fp"
      {
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
      }
      
    } // end phase
  }
  FallBack Off
}
