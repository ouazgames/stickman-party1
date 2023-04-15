Shader "Water2D/Simple Water"
{
  Properties
  {
    _Color ("Color", Color) = (1,1,1,1)
    _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
    _WiggleTex ("Base (RGB)", 2D) = "white" {}
    _WiggleStrength ("Wiggle Strength", Range(0.01, 0.2)) = 1
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
      Blend SrcAlpha OneMinusSrcAlpha
      GpuProgramID 59321
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
          uniform 	mediump vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute highp vec4 in_TEXCOORD0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          varying mediump vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD0.xy = u_xlat0.xy;
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
          uniform 	vec4 _SinTime;
          uniform 	vec4 _CosTime;
          uniform 	mediump vec4 _Color;
          uniform 	mediump float _WiggleStrength;
          uniform lowp sampler2D _WiggleTex;
          uniform lowp sampler2D _MainTex;
          varying mediump vec4 vs_COLOR0;
          varying mediump vec2 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec2 u_xlat0;
          mediump vec4 u_xlat16_0;
          lowp vec4 u_xlat10_0;
          mediump float u_xlat16_1;
          vec2 u_xlat2;
          mediump float u_xlat16_2;
          void main()
          {
              u_xlat0.x = vs_TEXCOORD0.x + (-_SinTime.x);
              u_xlat0.y = vs_TEXCOORD0.y + _CosTime.x;
              u_xlat10_0.xy = texture2D(_WiggleTex, u_xlat0.xy).xz;
              u_xlat16_1 = u_xlat10_0.y * _WiggleStrength;
              u_xlat16_2 = (-u_xlat10_0.x) * _WiggleStrength + vs_TEXCOORD0.x;
              u_xlat2.x = u_xlat16_2;
              u_xlat2.y = u_xlat16_1 * 1.5 + vs_TEXCOORD0.y;
              u_xlat10_0 = texture2D(_MainTex, u_xlat2.xy);
              u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
              u_xlat16_0 = u_xlat16_0 * _Color;
              SV_Target0 = u_xlat16_0;
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
          uniform 	mediump vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute highp vec4 in_TEXCOORD0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          varying mediump vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD0.xy = u_xlat0.xy;
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
          uniform 	vec4 _SinTime;
          uniform 	vec4 _CosTime;
          uniform 	mediump vec4 _Color;
          uniform 	mediump float _WiggleStrength;
          uniform lowp sampler2D _WiggleTex;
          uniform lowp sampler2D _MainTex;
          varying mediump vec4 vs_COLOR0;
          varying mediump vec2 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec2 u_xlat0;
          mediump vec4 u_xlat16_0;
          lowp vec4 u_xlat10_0;
          mediump float u_xlat16_1;
          vec2 u_xlat2;
          mediump float u_xlat16_2;
          void main()
          {
              u_xlat0.x = vs_TEXCOORD0.x + (-_SinTime.x);
              u_xlat0.y = vs_TEXCOORD0.y + _CosTime.x;
              u_xlat10_0.xy = texture2D(_WiggleTex, u_xlat0.xy).xz;
              u_xlat16_1 = u_xlat10_0.y * _WiggleStrength;
              u_xlat16_2 = (-u_xlat10_0.x) * _WiggleStrength + vs_TEXCOORD0.x;
              u_xlat2.x = u_xlat16_2;
              u_xlat2.y = u_xlat16_1 * 1.5 + vs_TEXCOORD0.y;
              u_xlat10_0 = texture2D(_MainTex, u_xlat2.xy);
              u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
              u_xlat16_0 = u_xlat16_0 * _Color;
              SV_Target0 = u_xlat16_0;
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
          uniform 	mediump vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute highp vec4 in_TEXCOORD0;
          attribute mediump vec4 in_COLOR0;
          varying mediump vec4 vs_COLOR0;
          varying mediump vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD0.xy = u_xlat0.xy;
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
          uniform 	vec4 _SinTime;
          uniform 	vec4 _CosTime;
          uniform 	mediump vec4 _Color;
          uniform 	mediump float _WiggleStrength;
          uniform lowp sampler2D _WiggleTex;
          uniform lowp sampler2D _MainTex;
          varying mediump vec4 vs_COLOR0;
          varying mediump vec2 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec2 u_xlat0;
          mediump vec4 u_xlat16_0;
          lowp vec4 u_xlat10_0;
          mediump float u_xlat16_1;
          vec2 u_xlat2;
          mediump float u_xlat16_2;
          void main()
          {
              u_xlat0.x = vs_TEXCOORD0.x + (-_SinTime.x);
              u_xlat0.y = vs_TEXCOORD0.y + _CosTime.x;
              u_xlat10_0.xy = texture2D(_WiggleTex, u_xlat0.xy).xz;
              u_xlat16_1 = u_xlat10_0.y * _WiggleStrength;
              u_xlat16_2 = (-u_xlat10_0.x) * _WiggleStrength + vs_TEXCOORD0.x;
              u_xlat2.x = u_xlat16_2;
              u_xlat2.y = u_xlat16_1 * 1.5 + vs_TEXCOORD0.y;
              u_xlat10_0 = texture2D(_MainTex, u_xlat2.xy);
              u_xlat16_0 = u_xlat10_0 * vs_COLOR0;
              u_xlat16_0 = u_xlat16_0 * _Color;
              SV_Target0 = u_xlat16_0;
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
          uniform 	mediump vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in highp vec4 in_TEXCOORD0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out mediump vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD0.xy = u_xlat0.xy;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	vec4 _SinTime;
          uniform 	vec4 _CosTime;
          uniform 	mediump vec4 _Color;
          uniform 	mediump float _WiggleStrength;
          uniform mediump sampler2D _WiggleTex;
          uniform mediump sampler2D _MainTex;
          in mediump vec4 vs_COLOR0;
          in mediump vec2 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec2 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump float u_xlat16_1;
          vec2 u_xlat2;
          mediump float u_xlat16_2;
          void main()
          {
              u_xlat0.x = vs_TEXCOORD0.x + (-_SinTime.x);
              u_xlat0.y = vs_TEXCOORD0.y + _CosTime.x;
              u_xlat16_0.xy = texture(_WiggleTex, u_xlat0.xy).xz;
              u_xlat16_1 = u_xlat16_0.y * _WiggleStrength;
              u_xlat16_2 = (-u_xlat16_0.x) * _WiggleStrength + vs_TEXCOORD0.x;
              u_xlat2.x = u_xlat16_2;
              u_xlat2.y = u_xlat16_1 * 1.5 + vs_TEXCOORD0.y;
              u_xlat16_0 = texture(_MainTex, u_xlat2.xy);
              u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
              u_xlat16_0 = u_xlat16_0 * _Color;
              SV_Target0 = u_xlat16_0;
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
          uniform 	mediump vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in highp vec4 in_TEXCOORD0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out mediump vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD0.xy = u_xlat0.xy;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	vec4 _SinTime;
          uniform 	vec4 _CosTime;
          uniform 	mediump vec4 _Color;
          uniform 	mediump float _WiggleStrength;
          uniform mediump sampler2D _WiggleTex;
          uniform mediump sampler2D _MainTex;
          in mediump vec4 vs_COLOR0;
          in mediump vec2 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec2 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump float u_xlat16_1;
          vec2 u_xlat2;
          mediump float u_xlat16_2;
          void main()
          {
              u_xlat0.x = vs_TEXCOORD0.x + (-_SinTime.x);
              u_xlat0.y = vs_TEXCOORD0.y + _CosTime.x;
              u_xlat16_0.xy = texture(_WiggleTex, u_xlat0.xy).xz;
              u_xlat16_1 = u_xlat16_0.y * _WiggleStrength;
              u_xlat16_2 = (-u_xlat16_0.x) * _WiggleStrength + vs_TEXCOORD0.x;
              u_xlat2.x = u_xlat16_2;
              u_xlat2.y = u_xlat16_1 * 1.5 + vs_TEXCOORD0.y;
              u_xlat16_0 = texture(_MainTex, u_xlat2.xy);
              u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
              u_xlat16_0 = u_xlat16_0 * _Color;
              SV_Target0 = u_xlat16_0;
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
          uniform 	mediump vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in highp vec4 in_TEXCOORD0;
          in mediump vec4 in_COLOR0;
          out mediump vec4 vs_COLOR0;
          out mediump vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD0.xy = u_xlat0.xy;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	vec4 _SinTime;
          uniform 	vec4 _CosTime;
          uniform 	mediump vec4 _Color;
          uniform 	mediump float _WiggleStrength;
          uniform mediump sampler2D _WiggleTex;
          uniform mediump sampler2D _MainTex;
          in mediump vec4 vs_COLOR0;
          in mediump vec2 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec2 u_xlat0;
          mediump vec4 u_xlat16_0;
          mediump float u_xlat16_1;
          vec2 u_xlat2;
          mediump float u_xlat16_2;
          void main()
          {
              u_xlat0.x = vs_TEXCOORD0.x + (-_SinTime.x);
              u_xlat0.y = vs_TEXCOORD0.y + _CosTime.x;
              u_xlat16_0.xy = texture(_WiggleTex, u_xlat0.xy).xz;
              u_xlat16_1 = u_xlat16_0.y * _WiggleStrength;
              u_xlat16_2 = (-u_xlat16_0.x) * _WiggleStrength + vs_TEXCOORD0.x;
              u_xlat2.x = u_xlat16_2;
              u_xlat2.y = u_xlat16_1 * 1.5 + vs_TEXCOORD0.y;
              u_xlat16_0 = texture(_MainTex, u_xlat2.xy);
              u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
              u_xlat16_0 = u_xlat16_0 * _Color;
              SV_Target0 = u_xlat16_0;
              return;
          }
          
          #endif
          
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
      }
      
    } // end phase
  }
  FallBack Off
}
