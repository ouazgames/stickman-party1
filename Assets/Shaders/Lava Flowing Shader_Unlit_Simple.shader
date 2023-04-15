Shader "Lava Flowing Shader/Unlit/Simple"
{
  Properties
  {
    _MainTex ("_MainTex RGBA", 2D) = "white" {}
    _LavaTex ("_LavaTex RGB", 2D) = "white" {}
  }
  SubShader
  {
    Tags
    { 
      "RenderType" = "Opaque"
    }
    Pass // ind: 1, name: 
    {
      Tags
      { 
        "RenderType" = "Opaque"
      }
      GpuProgramID 55718
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
          uniform 	mediump vec4 _LavaTex_ST;
          attribute mediump vec4 in_POSITION0;
          attribute mediump vec2 in_TEXCOORD0;
          varying mediump vec2 vs_TEXCOORD0;
          varying mediump vec2 vs_TEXCOORD1;
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
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + _LavaTex_ST.zw;
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
          uniform lowp sampler2D _LavaTex;
          varying mediump vec2 vs_TEXCOORD0;
          varying mediump vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          lowp vec4 u_xlat10_0;
          lowp vec4 u_xlat10_1;
          mediump vec4 u_xlat16_2;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
              u_xlat10_1 = texture2D(_LavaTex, vs_TEXCOORD1.xy);
              u_xlat16_2 = u_xlat10_0 + (-u_xlat10_1);
              SV_Target0 = u_xlat10_0.wwww * u_xlat16_2 + u_xlat10_1;
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
          uniform 	mediump vec4 _LavaTex_ST;
          attribute mediump vec4 in_POSITION0;
          attribute mediump vec2 in_TEXCOORD0;
          varying mediump vec2 vs_TEXCOORD0;
          varying mediump vec2 vs_TEXCOORD1;
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
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + _LavaTex_ST.zw;
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
          uniform lowp sampler2D _LavaTex;
          varying mediump vec2 vs_TEXCOORD0;
          varying mediump vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          lowp vec4 u_xlat10_0;
          lowp vec4 u_xlat10_1;
          mediump vec4 u_xlat16_2;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
              u_xlat10_1 = texture2D(_LavaTex, vs_TEXCOORD1.xy);
              u_xlat16_2 = u_xlat10_0 + (-u_xlat10_1);
              SV_Target0 = u_xlat10_0.wwww * u_xlat16_2 + u_xlat10_1;
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
          uniform 	mediump vec4 _LavaTex_ST;
          attribute mediump vec4 in_POSITION0;
          attribute mediump vec2 in_TEXCOORD0;
          varying mediump vec2 vs_TEXCOORD0;
          varying mediump vec2 vs_TEXCOORD1;
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
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + _LavaTex_ST.zw;
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
          uniform lowp sampler2D _LavaTex;
          varying mediump vec2 vs_TEXCOORD0;
          varying mediump vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          lowp vec4 u_xlat10_0;
          lowp vec4 u_xlat10_1;
          mediump vec4 u_xlat16_2;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
              u_xlat10_1 = texture2D(_LavaTex, vs_TEXCOORD1.xy);
              u_xlat16_2 = u_xlat10_0 + (-u_xlat10_1);
              SV_Target0 = u_xlat10_0.wwww * u_xlat16_2 + u_xlat10_1;
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
          uniform 	mediump vec4 _LavaTex_ST;
          in mediump vec4 in_POSITION0;
          in mediump vec2 in_TEXCOORD0;
          out mediump vec2 vs_TEXCOORD0;
          out mediump vec2 vs_TEXCOORD1;
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
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + _LavaTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          uniform mediump sampler2D _LavaTex;
          in mediump vec2 vs_TEXCOORD0;
          in mediump vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          mediump vec4 u_xlat16_1;
          mediump vec4 u_xlat16_2;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
              u_xlat16_1 = texture(_LavaTex, vs_TEXCOORD1.xy);
              u_xlat16_2 = u_xlat16_0 + (-u_xlat16_1);
              SV_Target0 = u_xlat16_0.wwww * u_xlat16_2 + u_xlat16_1;
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
          uniform 	mediump vec4 _LavaTex_ST;
          in mediump vec4 in_POSITION0;
          in mediump vec2 in_TEXCOORD0;
          out mediump vec2 vs_TEXCOORD0;
          out mediump vec2 vs_TEXCOORD1;
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
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + _LavaTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          uniform mediump sampler2D _LavaTex;
          in mediump vec2 vs_TEXCOORD0;
          in mediump vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          mediump vec4 u_xlat16_1;
          mediump vec4 u_xlat16_2;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
              u_xlat16_1 = texture(_LavaTex, vs_TEXCOORD1.xy);
              u_xlat16_2 = u_xlat16_0 + (-u_xlat16_1);
              SV_Target0 = u_xlat16_0.wwww * u_xlat16_2 + u_xlat16_1;
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
          uniform 	mediump vec4 _LavaTex_ST;
          in mediump vec4 in_POSITION0;
          in mediump vec2 in_TEXCOORD0;
          out mediump vec2 vs_TEXCOORD0;
          out mediump vec2 vs_TEXCOORD1;
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
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat0;
              vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LavaTex_ST.xy + _LavaTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          uniform mediump sampler2D _LavaTex;
          in mediump vec2 vs_TEXCOORD0;
          in mediump vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          mediump vec4 u_xlat16_1;
          mediump vec4 u_xlat16_2;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
              u_xlat16_1 = texture(_LavaTex, vs_TEXCOORD1.xy);
              u_xlat16_2 = u_xlat16_0 + (-u_xlat16_1);
              SV_Target0 = u_xlat16_0.wwww * u_xlat16_2 + u_xlat16_1;
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
