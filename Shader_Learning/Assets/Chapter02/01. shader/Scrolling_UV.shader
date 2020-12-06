Shader "Custom/Scrolling_UV"
{
    Properties
    {
        _MainTint ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
       
        
        [space]
        [space]
        [space]
        [space]
        
        _ScrollingUV_X_speed ("Scrolling_UV_X_MoveSpeed", Range(0,10)) = 2.0
        _ScrollingUV_Y_speed ("Scrolling_UV_Y_MoveSpeed", Range(0,10)) = 2.0
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

       
        fixed4 _MainTint;
        fixed _ScrollingUV_X_speed;
        fixed _ScrollingUV_Y_speed;
        

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
           fixed2 scrolledUV =  IN.uv_MainTex;
           fixed xMoveValue = _ScrollingUV_X_speed * _Time;
           fixed yMoveValue = _ScrollingUV_Y_speed * _Time;
           
           scrolledUV += fixed2(xMoveValue,yMoveValue);
           
           half4 c = tex2D(_MainTex, scrolledUV);
           
           o.Albedo = c.rgb * _MainTint;
           o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
