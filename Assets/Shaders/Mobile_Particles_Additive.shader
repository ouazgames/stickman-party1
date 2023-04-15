Shader "Mobile/Particles/Additive"
{
  Properties
  {
    _MainTex ("Particle Texture", 2D) = "white" {}
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "PreviewType" = "Plane"
      "QUEUE" = "Transparent"
      "RenderType" = "Transparent"
    }
    Pass // ind: 1, name: 
    {
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "PreviewType" = "Plane"
        "QUEUE" = "Transparent"
        "RenderType" = "Transparent"
      }
      ZWrite Off
      Cull Off
      Fog
      { 
        Mode  Off
      } 
      Blend SrcAlpha One
      GpuProgramID 10119
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
          uniform 	vec4 _MainTex_ST;
          attribute highp vec3 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec3 in_TEXCOORD0;
          varying mediump vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
              vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform lowp sampler2D _MainTex;
          varying mediump vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          lowp vec4 u_xlat10_0;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
              SV_Target0 = u_xlat10_0 * vs_COLOR0;
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
          uniform 	vec4 _MainTex_ST;
          attribute highp vec3 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec3 in_TEXCOORD0;
          varying mediump vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
              vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform lowp sampler2D _MainTex;
          varying mediump vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          lowp vec4 u_xlat10_0;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
              SV_Target0 = u_xlat10_0 * vs_COLOR0;
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
          uniform 	vec4 _MainTex_ST;
          attribute highp vec3 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec3 in_TEXCOORD0;
          varying mediump vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
              vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform lowp sampler2D _MainTex;
          varying mediump vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          lowp vec4 u_xlat10_0;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
              SV_Target0 = u_xlat10_0 * vs_COLOR0;
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
          uniform 	vec4 _MainTex_ST;
          in highp vec3 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec3 in_TEXCOORD0;
          out mediump vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
          #ifdef UNITY_ADRENO_ES3
              vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
          #else
              vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
          #endif
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform mediump sampler2D _MainTex;
          in mediump vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
              SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
          uniform 	vec4 _MainTex_ST;
          in highp vec3 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec3 in_TEXCOORD0;
          out mediump vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
          #ifdef UNITY_ADRENO_ES3
              vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
          #else
              vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
          #endif
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform mediump sampler2D _MainTex;
          in mediump vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
              SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
          uniform 	vec4 _MainTex_ST;
          in highp vec3 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec3 in_TEXCOORD0;
          out mediump vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              vs_COLOR0 = in_COLOR0;
          #ifdef UNITY_ADRENO_ES3
              vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
          #else
              vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
          #endif
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform mediump sampler2D _MainTex;
          in mediump vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD0;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
              SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
