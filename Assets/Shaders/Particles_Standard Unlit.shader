Shader "Particles/Standard Unlit"
{
  Properties
  {
    _MainTex ("Albedo", 2D) = "white" {}
    _Color ("Color", Color) = (1,1,1,1)
    _Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
    _BumpScale ("Scale", float) = 1
    _BumpMap ("Normal Map", 2D) = "bump" {}
    _EmissionColor ("Color", Color) = (0,0,0,1)
    _EmissionMap ("Emission", 2D) = "white" {}
    _DistortionStrength ("Strength", float) = 1
    _DistortionBlend ("Blend", Range(0, 1)) = 0.5
    _SoftParticlesNearFadeDistance ("Soft Particles Near Fade", float) = 0
    _SoftParticlesFarFadeDistance ("Soft Particles Far Fade", float) = 1
    _CameraNearFadeDistance ("Camera Near Fade", float) = 1
    _CameraFarFadeDistance ("Camera Far Fade", float) = 2
    [HideInInspector] _Mode ("__mode", float) = 0
    [HideInInspector] _ColorMode ("__colormode", float) = 0
    [HideInInspector] _FlipbookMode ("__flipbookmode", float) = 0
    [HideInInspector] _LightingEnabled ("__lightingenabled", float) = 0
    [HideInInspector] _DistortionEnabled ("__distortionenabled", float) = 0
    [HideInInspector] _EmissionEnabled ("__emissionenabled", float) = 0
    [HideInInspector] _BlendOp ("__blendop", float) = 0
    [HideInInspector] _SrcBlend ("__src", float) = 1
    [HideInInspector] _DstBlend ("__dst", float) = 0
    [HideInInspector] _ZWrite ("__zw", float) = 1
    [HideInInspector] _Cull ("__cull", float) = 2
    [HideInInspector] _SoftParticlesEnabled ("__softparticlesenabled", float) = 0
    [HideInInspector] _CameraFadingEnabled ("__camerafadingenabled", float) = 0
    [HideInInspector] _SoftParticleFadeParams ("__softparticlefadeparams", Vector) = (0,0,0,0)
    [HideInInspector] _CameraFadeParams ("__camerafadeparams", Vector) = (0,0,0,0)
    [HideInInspector] _ColorAddSubDiff ("__coloraddsubdiff", Vector) = (0,0,0,0)
    [HideInInspector] _DistortionStrengthScaled ("__distortionstrengthscaled", float) = 0
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "PerformanceChecks" = "False"
      "PreviewType" = "Plane"
      "RenderType" = "Opaque"
    }
    Pass // ind: 1, name: 
    {
      Tags
      { 
      }
      ZClip Off
      ZWrite Off
      Cull Off
      Stencil
      { 
        Ref 0
        ReadMask 0
        WriteMask 0
        Pass Keep
        Fail Keep
        ZFail Keep
        PassFront Keep
        FailFront Keep
        ZFailFront Keep
        PassBack Keep
        FailBack Keep
        ZFailBack Keep
      } 
      GpuProgramID -1
      // m_ProgramMask = 0
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      
    } // end phase
    Pass // ind: 2, name: ShadowCaster
    {
      Name "ShadowCaster"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "SHADOWCASTER"
        "PerformanceChecks" = "False"
        "PreviewType" = "Plane"
        "RenderType" = "Opaque"
        "SHADOWSUPPORT" = "true"
      }
      Cull Off
      ColorMask RGB
      GpuProgramID 18939
      // m_ProgramMask = 6
      !!! *******************************************************************************************
      !!! Allow restore shader as UnityLab format - only available for DevX GameRecovery license type
      !!! *******************************************************************************************
      Program "vp"
      {
        SubProgram "gles hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          attribute highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
          #define SV_Target0 gl_FragData[0]
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
          #ifdef UNITY_ADRENO_ES3
              u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
          #else
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
          #endif
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
          #ifdef UNITY_ADRENO_ES3
              u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
          #else
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
          #endif
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
          #ifdef UNITY_ADRENO_ES3
              u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
          #else
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
          #endif
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec3 vs_TEXCOORD0;
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
              vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
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
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 unity_LightShadowBias;
          uniform lowp sampler2D _MainTex;
          varying highp vec3 vs_TEXCOORD0;
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          lowp float u_xlat10_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat10_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * -1))!=0){discard;}
              u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
              u_xlat0.x = sqrt(u_xlat0.x);
              u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
              u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
              u_xlat0.x = min(u_xlat0.x, 0.999000013);
              u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
              SV_Target0 = u_xlat0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec3 vs_TEXCOORD0;
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
              vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
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
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 unity_LightShadowBias;
          uniform lowp sampler2D _MainTex;
          varying highp vec3 vs_TEXCOORD0;
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          lowp float u_xlat10_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat10_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * -1))!=0){discard;}
              u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
              u_xlat0.x = sqrt(u_xlat0.x);
              u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
              u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
              u_xlat0.x = min(u_xlat0.x, 0.999000013);
              u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
              SV_Target0 = u_xlat0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec3 vs_TEXCOORD0;
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
              vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
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
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 unity_LightShadowBias;
          uniform lowp sampler2D _MainTex;
          varying highp vec3 vs_TEXCOORD0;
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          lowp float u_xlat10_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat10_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * -1))!=0){discard;}
              u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
              u_xlat0.x = sqrt(u_xlat0.x);
              u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
              u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
              u_xlat0.x = min(u_xlat0.x, 0.999000013);
              u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
              SV_Target0 = u_xlat0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec2 vs_TEXCOORD1;
          out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          in highp vec2 vs_TEXCOORD1;
          in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb0 = !!(u_xlat16_1<0.0);
          #else
              u_xlatb0 = u_xlat16_1<0.0;
          #endif
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec2 vs_TEXCOORD1;
          out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          in highp vec2 vs_TEXCOORD1;
          in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb0 = !!(u_xlat16_1<0.0);
          #else
              u_xlatb0 = u_xlat16_1<0.0;
          #endif
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec2 vs_TEXCOORD1;
          out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          in highp vec2 vs_TEXCOORD1;
          in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb0 = !!(u_xlat16_1<0.0);
          #else
              u_xlatb0 = u_xlat16_1<0.0;
          #endif
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          varying highp vec3 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
              vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
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
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 unity_LightShadowBias;
          varying highp vec3 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          void main()
          {
              u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
              u_xlat0.x = sqrt(u_xlat0.x);
              u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
              u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
              u_xlat0.x = min(u_xlat0.x, 0.999000013);
              u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
              SV_Target0 = u_xlat0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          varying highp vec3 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
              vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
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
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 unity_LightShadowBias;
          varying highp vec3 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          void main()
          {
              u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
              u_xlat0.x = sqrt(u_xlat0.x);
              u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
              u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
              u_xlat0.x = min(u_xlat0.x, 0.999000013);
              u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
              SV_Target0 = u_xlat0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          attribute highp vec4 in_POSITION0;
          varying highp vec3 vs_TEXCOORD0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
              u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
              vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
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
          uniform 	vec4 _LightPositionRange;
          uniform 	vec4 unity_LightShadowBias;
          varying highp vec3 vs_TEXCOORD0;
          #define SV_Target0 gl_FragData[0]
          vec4 u_xlat0;
          void main()
          {
              u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
              u_xlat0.x = sqrt(u_xlat0.x);
              u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
              u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
              u_xlat0.x = min(u_xlat0.x, 0.999000013);
              u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
              u_xlat0 = fract(u_xlat0);
              u_xlat0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
              SV_Target0 = u_xlat0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute highp vec3 in_NORMAL0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          #define SV_Target0 gl_FragData[0]
          lowp float u_xlat10_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat10_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * -1))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute highp vec3 in_NORMAL0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          #define SV_Target0 gl_FragData[0]
          lowp float u_xlat10_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat10_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * -1))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute highp vec3 in_NORMAL0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
          varying highp vec2 vs_TEXCOORD1;
          varying mediump vec4 vs_TEXCOORD3;
          #define SV_Target0 gl_FragData[0]
          lowp float u_xlat10_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat10_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * -1))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec2 vs_TEXCOORD1;
          out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
          #ifdef UNITY_ADRENO_ES3
              u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
          #else
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
          #endif
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          in highp vec2 vs_TEXCOORD1;
          in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb0 = !!(u_xlat16_1<0.0);
          #else
              u_xlatb0 = u_xlat16_1<0.0;
          #endif
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec2 vs_TEXCOORD1;
          out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
          #ifdef UNITY_ADRENO_ES3
              u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
          #else
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
          #endif
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          in highp vec2 vs_TEXCOORD1;
          in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb0 = !!(u_xlat16_1<0.0);
          #else
              u_xlatb0 = u_xlat16_1<0.0;
          #endif
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec2 vs_TEXCOORD1;
          out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          float u_xlat6;
          float u_xlat9;
          bool u_xlatb9;
          void main()
          {
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
              u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
              u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
              u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat9 = inversesqrt(u_xlat9);
              u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
              u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
              u_xlat9 = sqrt(u_xlat9);
              u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
          #else
              u_xlatb9 = unity_LightShadowBias.z!=0.0;
          #endif
              u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
          #ifdef UNITY_ADRENO_ES3
              u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
          #else
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
          #endif
              u_xlat6 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat6);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat6) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          in highp vec2 vs_TEXCOORD1;
          in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
          #ifdef UNITY_ADRENO_ES3
              u_xlatb0 = !!(u_xlat16_1<0.0);
          #else
              u_xlatb0 = u_xlat16_1<0.0;
          #endif
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat14;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat14 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat14);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat14) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat14;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat14;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat14 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat14);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat14) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat14;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat14;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat14 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat14);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat14) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat14;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec2 vs_TEXCOORD1;
          layout(location = 1) out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat14;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat7.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(52 >> 2) + 0]);
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat14 = u_xlat7.x / unity_ParticleUVShiftData.y;
              u_xlat14 = floor(u_xlat14);
              u_xlat7.x = (-u_xlat14) * unity_ParticleUVShiftData.y + u_xlat7.x;
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat1.x = u_xlat7.x * unity_ParticleUVShiftData.z;
              u_xlat7.x = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat14) * unity_ParticleUVShiftData.w + u_xlat7.x;
              u_xlat7.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb21 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat7.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec2 vs_TEXCOORD1;
          layout(location = 1) in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec2 vs_TEXCOORD1;
          layout(location = 1) out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat14;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat7.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(52 >> 2) + 0]);
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat14 = u_xlat7.x / unity_ParticleUVShiftData.y;
              u_xlat14 = floor(u_xlat14);
              u_xlat7.x = (-u_xlat14) * unity_ParticleUVShiftData.y + u_xlat7.x;
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat1.x = u_xlat7.x * unity_ParticleUVShiftData.z;
              u_xlat7.x = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat14) * unity_ParticleUVShiftData.w + u_xlat7.x;
              u_xlat7.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb21 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat7.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec2 vs_TEXCOORD1;
          layout(location = 1) in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec2 vs_TEXCOORD1;
          layout(location = 1) out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat14;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat7.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(52 >> 2) + 0]);
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat14 = u_xlat7.x / unity_ParticleUVShiftData.y;
              u_xlat14 = floor(u_xlat14);
              u_xlat7.x = (-u_xlat14) * unity_ParticleUVShiftData.y + u_xlat7.x;
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat1.x = u_xlat7.x * unity_ParticleUVShiftData.z;
              u_xlat7.x = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat14) * unity_ParticleUVShiftData.w + u_xlat7.x;
              u_xlat7.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb21 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat7.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec2 vs_TEXCOORD1;
          layout(location = 1) in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
              u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
              gl_Position.xyw = u_xlat0.xyw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          layout(location = 0) out mediump vec4 SV_Target0;
          void main()
          {
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec2 vs_TEXCOORD1;
          layout(location = 1) out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat14;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat7.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(52 >> 2) + 0]);
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat14 = u_xlat7.x / unity_ParticleUVShiftData.y;
              u_xlat14 = floor(u_xlat14);
              u_xlat7.x = (-u_xlat14) * unity_ParticleUVShiftData.y + u_xlat7.x;
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat1.x = u_xlat7.x * unity_ParticleUVShiftData.z;
              u_xlat7.x = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat14) * unity_ParticleUVShiftData.w + u_xlat7.x;
              u_xlat7.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb21 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat7.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat14 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat14);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat14) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat14;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec2 vs_TEXCOORD1;
          layout(location = 1) in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec2 vs_TEXCOORD1;
          layout(location = 1) out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat14;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat7.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(52 >> 2) + 0]);
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat14 = u_xlat7.x / unity_ParticleUVShiftData.y;
              u_xlat14 = floor(u_xlat14);
              u_xlat7.x = (-u_xlat14) * unity_ParticleUVShiftData.y + u_xlat7.x;
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat1.x = u_xlat7.x * unity_ParticleUVShiftData.z;
              u_xlat7.x = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat14) * unity_ParticleUVShiftData.w + u_xlat7.x;
              u_xlat7.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb21 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat7.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat14 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat14);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat14) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat14;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec2 vs_TEXCOORD1;
          layout(location = 1) in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _WorldSpaceLightPos0;
          uniform 	vec4 unity_LightShadowBias;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in highp vec3 in_NORMAL0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec2 vs_TEXCOORD1;
          layout(location = 1) out mediump vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          int u_xlati0;
          vec4 u_xlat1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec3 u_xlat4;
          vec3 u_xlat5;
          vec3 u_xlat6;
          vec3 u_xlat7;
          float u_xlat14;
          float u_xlat21;
          bool u_xlatb21;
          void main()
          {
              u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat7.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(52 >> 2) + 0]);
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat14 = u_xlat7.x / unity_ParticleUVShiftData.y;
              u_xlat14 = floor(u_xlat14);
              u_xlat7.x = (-u_xlat14) * unity_ParticleUVShiftData.y + u_xlat7.x;
              u_xlat7.x = floor(u_xlat7.x);
              u_xlat1.x = u_xlat7.x * unity_ParticleUVShiftData.z;
              u_xlat7.x = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat14) * unity_ParticleUVShiftData.w + u_xlat7.x;
              u_xlat7.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb21 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat7.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              vs_TEXCOORD3 = in_COLOR0;
              u_xlat1.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(24 >> 2) + 0]));
              u_xlat2.z = u_xlat1.y;
              u_xlat3.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(0 >> 2) + 2]));
              u_xlat2.x = u_xlat3.z;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(12 >> 2) + 2]));
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati0].value[(36 >> 2) + 2]));
              u_xlat2.y = u_xlat7.z;
              u_xlat3.z = u_xlat1.x;
              u_xlat1.x = u_xlat3.y;
              u_xlat1.y = u_xlat7.x;
              u_xlat3.y = u_xlat7.y;
              u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
              u_xlat0.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat0.xyz);
              u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
              u_xlat5.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat5.xyz);
              u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
              u_xlat21 = float(1.0) / float(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat0.y = dot(in_NORMAL0.xyz, u_xlat0.xyz);
              u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
              u_xlat6.xyz = u_xlat1.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
              u_xlat6.xyz = vec3(u_xlat21) * u_xlat6.xyz;
              u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
              u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat5.xyz);
              u_xlat0.z = dot(in_NORMAL0.xyz, u_xlat6.xyz);
              u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
              u_xlat1.w = u_xlat4.x;
              u_xlat1.x = dot(u_xlat1, in_POSITION0);
              u_xlat3.w = u_xlat4.y;
              u_xlat2.w = u_xlat4.z;
              u_xlat1.z = dot(u_xlat2, in_POSITION0);
              u_xlat1.y = dot(u_xlat3, in_POSITION0);
              u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
              u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
              u_xlat21 = inversesqrt(u_xlat21);
              u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
              u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
              u_xlat21 = (-u_xlat21) * u_xlat21 + 1.0;
              u_xlat21 = sqrt(u_xlat21);
              u_xlat21 = u_xlat21 * unity_LightShadowBias.z;
              u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat1.xyz;
              u_xlatb21 = unity_LightShadowBias.z!=0.0;
              u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * in_POSITION0.wwww + u_xlat0;
              u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
              u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
              u_xlat14 = u_xlat0.z + u_xlat1.x;
              u_xlat1.x = max((-u_xlat0.w), u_xlat14);
              gl_Position.xyw = u_xlat0.xyw;
              u_xlat0.x = (-u_xlat14) + u_xlat1.x;
              gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat14;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec2 vs_TEXCOORD1;
          layout(location = 1) in mediump vec4 vs_TEXCOORD3;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump float u_xlat16_0;
          bool u_xlatb0;
          mediump float u_xlat16_1;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
              u_xlat16_1 = u_xlat16_0 * vs_TEXCOORD3.w + -0.5;
              u_xlatb0 = u_xlat16_1<0.0;
              if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
              SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_CUBE" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SHADOWS_DEPTH" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
      }
      
    } // end phase
    Pass // ind: 3, name: 
    {
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "FORWARDBASE"
        "PerformanceChecks" = "False"
        "PreviewType" = "Plane"
        "RenderType" = "Opaque"
      }
      ZWrite Off
      Cull Off
      Blend Zero Zero
      ColorMask RGB
      GpuProgramID 247908
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
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform 	mediump vec4 _Color;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          vec3 u_xlat0;
          lowp vec3 u_xlat10_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
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
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform 	mediump vec4 _Color;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          vec3 u_xlat0;
          lowp vec3 u_xlat10_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
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
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform 	mediump vec4 _Color;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          vec3 u_xlat0;
          lowp vec3 u_xlat10_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
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
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
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
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
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
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          mediump vec4 u_xlat16_0;
          lowp vec4 u_xlat10_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat10_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          mediump vec4 u_xlat16_0;
          lowp vec4 u_xlat10_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat10_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          mediump vec4 u_xlat16_0;
          lowp vec4 u_xlat10_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat10_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
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
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          vec4 u_xlat0;
          vec2 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          float u_xlat6;
          vec3 u_xlat7;
          uvec3 u_xlatu7;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
              u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu7.x = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat2.x = float(u_xlatu7.x);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu7.z = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat2.yzw = vec3(u_xlatu7.xyz);
              u_xlat0 = u_xlat0 * u_xlat2;
              vs_COLOR0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat0.x = floor(u_xlat0.x);
              u_xlat6 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat6 = floor(u_xlat6);
              u_xlat1.x = u_xlat6 * unity_ParticleUVShiftData.z;
              u_xlat6 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat6;
              u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          vec4 u_xlat0;
          vec2 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          float u_xlat6;
          vec3 u_xlat7;
          uvec3 u_xlatu7;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
              u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu7.x = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat2.x = float(u_xlatu7.x);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu7.z = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat2.yzw = vec3(u_xlatu7.xyz);
              u_xlat0 = u_xlat0 * u_xlat2;
              vs_COLOR0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat0.x = floor(u_xlat0.x);
              u_xlat6 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat6 = floor(u_xlat6);
              u_xlat1.x = u_xlat6 * unity_ParticleUVShiftData.z;
              u_xlat6 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat6;
              u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          vec4 u_xlat0;
          vec2 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          float u_xlat6;
          vec3 u_xlat7;
          uvec3 u_xlatu7;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
              u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu7.x = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat2.x = float(u_xlatu7.x);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu7.z = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat2.yzw = vec3(u_xlatu7.xyz);
              u_xlat0 = u_xlat0 * u_xlat2;
              vs_COLOR0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat0.x = floor(u_xlat0.x);
              u_xlat6 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat6 = floor(u_xlat6);
              u_xlat1.x = u_xlat6 * unity_ParticleUVShiftData.z;
              u_xlat6 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat6;
              u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          vec4 u_xlat0;
          vec2 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          float u_xlat6;
          vec3 u_xlat7;
          uvec3 u_xlatu7;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
              u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu7.x = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat2.x = float(u_xlatu7.x);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu7.z = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat2.yzw = vec3(u_xlatu7.xyz);
              u_xlat0 = u_xlat0 * u_xlat2;
              vs_COLOR0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat0.x = floor(u_xlat0.x);
              u_xlat6 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat6 = floor(u_xlat6);
              u_xlat1.x = u_xlat6 * unity_ParticleUVShiftData.z;
              u_xlat6 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat6;
              u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          vec4 u_xlat0;
          vec2 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          float u_xlat6;
          vec3 u_xlat7;
          uvec3 u_xlatu7;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
              u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu7.x = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat2.x = float(u_xlatu7.x);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu7.z = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat2.yzw = vec3(u_xlatu7.xyz);
              u_xlat0 = u_xlat0 * u_xlat2;
              vs_COLOR0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat0.x = floor(u_xlat0.x);
              u_xlat6 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat6 = floor(u_xlat6);
              u_xlat1.x = u_xlat6 * unity_ParticleUVShiftData.z;
              u_xlat6 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat6;
              u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          vec4 u_xlat0;
          vec2 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          float u_xlat6;
          vec3 u_xlat7;
          uvec3 u_xlatu7;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
              u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu7.x = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat2.x = float(u_xlatu7.x);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu7.z = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat2.yzw = vec3(u_xlatu7.xyz);
              u_xlat0 = u_xlat0 * u_xlat2;
              vs_COLOR0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat0.x = floor(u_xlat0.x);
              u_xlat6 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat6 = floor(u_xlat6);
              u_xlat1.x = u_xlat6 * unity_ParticleUVShiftData.z;
              u_xlat6 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat6;
              u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          varying highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
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
          uniform 	mediump vec4 _Color;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          vec3 u_xlat0;
          lowp vec3 u_xlat10_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          varying highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
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
          uniform 	mediump vec4 _Color;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          vec3 u_xlat0;
          lowp vec3 u_xlat10_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          varying highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
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
          uniform 	mediump vec4 _Color;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          vec3 u_xlat0;
          lowp vec3 u_xlat10_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat10_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
          out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
          out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
          out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          varying highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
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
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          mediump vec4 u_xlat16_0;
          lowp vec4 u_xlat10_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat10_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          varying highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
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
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          mediump vec4 u_xlat16_0;
          lowp vec4 u_xlat10_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat10_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          #ifdef VERTEX
          #version 100
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          attribute highp vec4 in_POSITION0;
          attribute mediump vec4 in_COLOR0;
          attribute highp vec2 in_TEXCOORD0;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          varying highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
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
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform lowp sampler2D _MainTex;
          varying highp vec4 vs_COLOR0;
          varying highp vec2 vs_TEXCOORD1;
          #define SV_Target0 gl_FragData[0]
          mediump vec4 u_xlat16_0;
          lowp vec4 u_xlat10_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat10_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
          out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
          out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 300 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	vec4 _MainTex_ST;
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          out highp vec4 vs_COLOR0;
          out highp vec2 vs_TEXCOORD1;
          out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          float u_xlat2;
          void main()
          {
              u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
              u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
              u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
              u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
              u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
              gl_Position = u_xlat1;
              vs_COLOR0 = in_COLOR0;
              vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
              u_xlat0.w = u_xlat0.x * 0.5;
              u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat1.w;
              vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 300 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          in highp vec4 vs_COLOR0;
          in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          layout(location = 2) out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          vec3 u_xlat7;
          uvec2 u_xlatu7;
          float u_xlat12;
          uint u_xlatu12;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat13 = u_xlat13 * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat7.x + u_xlat13;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.x + u_xlat7.x;
              u_xlat0.x = u_xlat0.x + hlslcc_mtx4x4unity_MatrixV[3].z;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0 = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
              gl_Position = u_xlat0;
              u_xlat2 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat2 = vec4(unity_ParticleUseMeshColors) * u_xlat2 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu12 = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat3.x = float(u_xlatu12);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu12 = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat3.w = float(u_xlatu12);
              u_xlat3.yz = vec2(u_xlatu7.xy);
              u_xlat2 = u_xlat2 * u_xlat3;
              vs_COLOR0 = u_xlat2 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat12 = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat12 = floor(u_xlat12);
              u_xlat1.x = (-u_xlat12) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat1.x = u_xlat1.x * unity_ParticleUVShiftData.z;
              u_xlat13 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat12) * unity_ParticleUVShiftData.w + u_xlat13;
              u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat1.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
              u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat0.w;
              vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          layout(location = 2) out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          vec3 u_xlat7;
          uvec2 u_xlatu7;
          float u_xlat12;
          uint u_xlatu12;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat13 = u_xlat13 * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat7.x + u_xlat13;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.x + u_xlat7.x;
              u_xlat0.x = u_xlat0.x + hlslcc_mtx4x4unity_MatrixV[3].z;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0 = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
              gl_Position = u_xlat0;
              u_xlat2 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat2 = vec4(unity_ParticleUseMeshColors) * u_xlat2 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu12 = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat3.x = float(u_xlatu12);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu12 = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat3.w = float(u_xlatu12);
              u_xlat3.yz = vec2(u_xlatu7.xy);
              u_xlat2 = u_xlat2 * u_xlat3;
              vs_COLOR0 = u_xlat2 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat12 = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat12 = floor(u_xlat12);
              u_xlat1.x = (-u_xlat12) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat1.x = u_xlat1.x * unity_ParticleUVShiftData.z;
              u_xlat13 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat12) * unity_ParticleUVShiftData.w + u_xlat13;
              u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat1.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
              u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat0.w;
              vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          layout(location = 2) out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          vec3 u_xlat7;
          uvec2 u_xlatu7;
          float u_xlat12;
          uint u_xlatu12;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat13 = u_xlat13 * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat7.x + u_xlat13;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.x + u_xlat7.x;
              u_xlat0.x = u_xlat0.x + hlslcc_mtx4x4unity_MatrixV[3].z;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0 = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
              gl_Position = u_xlat0;
              u_xlat2 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat2 = vec4(unity_ParticleUseMeshColors) * u_xlat2 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu12 = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat3.x = float(u_xlatu12);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu12 = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat3.w = float(u_xlatu12);
              u_xlat3.yz = vec2(u_xlatu7.xy);
              u_xlat2 = u_xlat2 * u_xlat3;
              vs_COLOR0 = u_xlat2 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat12 = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat12 = floor(u_xlat12);
              u_xlat1.x = (-u_xlat12) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat1.x = u_xlat1.x * unity_ParticleUVShiftData.z;
              u_xlat13 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat12) * unity_ParticleUVShiftData.w + u_xlat13;
              u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat1.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
              u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat0.w;
              vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          vec3 u_xlat0;
          mediump vec3 u_xlat16_0;
          mediump vec3 u_xlat16_1;
          void main()
          {
              u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
              u_xlat16_1.xyz = u_xlat16_0.xyz * _Color.xyz;
              u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
              SV_Target0.xyz = u_xlat0.xyz;
              SV_Target0.w = 1.0;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          layout(location = 2) out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          vec3 u_xlat7;
          uvec2 u_xlatu7;
          float u_xlat12;
          uint u_xlatu12;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat13 = u_xlat13 * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat7.x + u_xlat13;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.x + u_xlat7.x;
              u_xlat0.x = u_xlat0.x + hlslcc_mtx4x4unity_MatrixV[3].z;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0 = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
              gl_Position = u_xlat0;
              u_xlat2 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat2 = vec4(unity_ParticleUseMeshColors) * u_xlat2 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu12 = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat3.x = float(u_xlatu12);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu12 = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat3.w = float(u_xlatu12);
              u_xlat3.yz = vec2(u_xlatu7.xy);
              u_xlat2 = u_xlat2 * u_xlat3;
              vs_COLOR0 = u_xlat2 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat12 = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat12 = floor(u_xlat12);
              u_xlat1.x = (-u_xlat12) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat1.x = u_xlat1.x * unity_ParticleUVShiftData.z;
              u_xlat13 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat12) * unity_ParticleUVShiftData.w + u_xlat13;
              u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat1.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
              u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat0.w;
              vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          layout(location = 2) out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          vec3 u_xlat7;
          uvec2 u_xlatu7;
          float u_xlat12;
          uint u_xlatu12;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat13 = u_xlat13 * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat7.x + u_xlat13;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.x + u_xlat7.x;
              u_xlat0.x = u_xlat0.x + hlslcc_mtx4x4unity_MatrixV[3].z;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0 = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
              gl_Position = u_xlat0;
              u_xlat2 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat2 = vec4(unity_ParticleUseMeshColors) * u_xlat2 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu12 = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat3.x = float(u_xlatu12);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu12 = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat3.w = float(u_xlatu12);
              u_xlat3.yz = vec2(u_xlatu7.xy);
              u_xlat2 = u_xlat2 * u_xlat3;
              vs_COLOR0 = u_xlat2 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat12 = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat12 = floor(u_xlat12);
              u_xlat1.x = (-u_xlat12) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat1.x = u_xlat1.x * unity_ParticleUVShiftData.z;
              u_xlat13 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat12) * unity_ParticleUVShiftData.w + u_xlat13;
              u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat1.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
              u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat0.w;
              vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
              return;
          }
          
          #endif
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          #ifdef VERTEX
          #version 310 es
          
          uniform 	vec4 _ProjectionParams;
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
          uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
          uniform 	int unity_BaseInstanceID;
          uniform 	vec4 unity_ParticleUVShiftData;
          uniform 	float unity_ParticleUseMeshColors;
          uniform 	vec4 _MainTex_ST;
           struct unity_ParticleInstanceData_type {
          	uint[14] value;
          };
          
          layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
          	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
          };
          in highp vec4 in_POSITION0;
          in mediump vec4 in_COLOR0;
          in highp vec2 in_TEXCOORD0;
          layout(location = 0) out highp vec4 vs_COLOR0;
          layout(location = 1) out highp vec2 vs_TEXCOORD1;
          layout(location = 2) out highp vec4 vs_TEXCOORD3;
          vec4 u_xlat0;
          vec4 u_xlat1;
          int u_xlati1;
          vec4 u_xlat2;
          vec4 u_xlat3;
          vec4 u_xlat4;
          vec4 u_xlat5;
          vec3 u_xlat7;
          uvec2 u_xlatu7;
          float u_xlat12;
          uint u_xlatu12;
          bool u_xlatb12;
          float u_xlat13;
          void main()
          {
              u_xlat0.xyz = in_POSITION0.xyz;
              u_xlat0.w = 1.0;
              u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
              u_xlat2.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
              u_xlat3.x = u_xlat2.z;
              u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
              u_xlat3.y = u_xlat4.x;
              u_xlat7.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]));
              u_xlat3.z = u_xlat7.y;
              u_xlat5 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
              u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat3.w = u_xlat5.y;
              u_xlat13 = dot(u_xlat3, u_xlat0);
              u_xlat3 = vec4(u_xlat13) * hlslcc_mtx4x4unity_MatrixVP[1];
              u_xlat13 = u_xlat13 * hlslcc_mtx4x4unity_MatrixV[1].z;
              u_xlat4.x = u_xlat2.y;
              u_xlat2.y = u_xlat4.z;
              u_xlat4.z = u_xlat7.x;
              u_xlat2.z = u_xlat7.z;
              u_xlat4.w = u_xlat5.x;
              u_xlat7.x = dot(u_xlat4, u_xlat0);
              u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat7.xxxx + u_xlat3;
              u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat7.x + u_xlat13;
              u_xlat2.w = u_xlat5.z;
              u_xlat0.x = dot(u_xlat2, u_xlat0);
              u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.xxxx + u_xlat3;
              u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.x + u_xlat7.x;
              u_xlat0.x = u_xlat0.x + hlslcc_mtx4x4unity_MatrixV[3].z;
              vs_TEXCOORD3.z = (-u_xlat0.x);
              u_xlat0 = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
              gl_Position = u_xlat0;
              u_xlat2 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
              u_xlat2 = vec4(unity_ParticleUseMeshColors) * u_xlat2 + vec4(1.0, 1.0, 1.0, 1.0);
              u_xlatu12 = floatBitsToUint(u_xlat5).w & 255u;
              u_xlat3.x = float(u_xlatu12);
              u_xlatu7.x = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(8), int(8));
              u_xlatu7.y = bitfieldExtract(floatBitsToUint(u_xlat5).w, int(16), int(8));
              u_xlatu12 = floatBitsToUint(u_xlat5).w >> 24u;
              u_xlat3.w = float(u_xlatu12);
              u_xlat3.yz = vec2(u_xlatu7.xy);
              u_xlat2 = u_xlat2 * u_xlat3;
              vs_COLOR0 = u_xlat2 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
              u_xlat12 = u_xlat1.x / unity_ParticleUVShiftData.y;
              u_xlat12 = floor(u_xlat12);
              u_xlat1.x = (-u_xlat12) * unity_ParticleUVShiftData.y + u_xlat1.x;
              u_xlat1.x = floor(u_xlat1.x);
              u_xlat1.x = u_xlat1.x * unity_ParticleUVShiftData.z;
              u_xlat13 = (-unity_ParticleUVShiftData.w) + 1.0;
              u_xlat1.y = (-u_xlat12) * unity_ParticleUVShiftData.w + u_xlat13;
              u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
              u_xlatb12 = unity_ParticleUVShiftData.x!=0.0;
              u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat1.xy : in_TEXCOORD0.xy;
              vs_TEXCOORD1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
              u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
              u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
              vs_TEXCOORD3.w = u_xlat0.w;
              vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
              return;
          }
          
          #endif
          #ifdef FRAGMENT
          #version 310 es
          
          precision highp float;
          precision highp int;
          uniform 	mediump vec4 _Color;
          uniform 	mediump vec4 _ColorAddSubDiff;
          uniform mediump sampler2D _MainTex;
          layout(location = 0) in highp vec4 vs_COLOR0;
          layout(location = 1) in highp vec2 vs_TEXCOORD1;
          layout(location = 0) out mediump vec4 SV_Target0;
          mediump vec4 u_xlat16_0;
          vec3 u_xlat1;
          mediump vec3 u_xlat16_2;
          float u_xlat10;
          void main()
          {
              u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy);
              u_xlat16_0 = u_xlat16_0 * _Color;
              u_xlat1.xyz = vs_COLOR0.xyz * _ColorAddSubDiff.xxx + u_xlat16_0.xyz;
              u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
              SV_Target0.w = u_xlat10;
              u_xlat16_2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
              SV_Target0.xyz = _ColorAddSubDiff.yyy * u_xlat16_2.xyz + u_xlat1.xyz;
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
        SubProgram "gles hw_tier00"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier00"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier01"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
        SubProgram "gles3 hw_tier02"
        {
           Keywords { "SOFTPARTICLES_ON" "PROCEDURAL_INSTANCING_ON" "_ALPHABLEND_ON" "_COLORADDSUBDIFF_ON" }
          
          "!!!!GLES3
          
          
          "
        }
      }
      
    } // end phase
  }
  FallBack "VertexLit"
}
