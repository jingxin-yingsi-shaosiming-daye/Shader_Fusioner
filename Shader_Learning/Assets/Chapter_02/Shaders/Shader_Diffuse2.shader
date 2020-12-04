  Shader "Custom/Shader_Chapter02/Diffuse"        //shader路径
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Glossiness ("Smothness",Range(0,1)) =0.5  //  Range  浮点类型的属性  
        _Metallic ("Metallic",Range(0,1)) =0.5
        
        _AmbientColor("Ambient Color ",Color) = (1,1,1,1)
        _MySliderValue("This is a slider", Range(0,10)) =5
       
       //Color 
       // 2D  2的指数的纹理
       // Rect 无限制的图片
       // Cube 立方体映射
       // Float 不会创建滑动器 没有约束
       // Vector 向量
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows
        // 下面定义的surf表面处理函数  Standard:unity的标准光照模型  funllforwardshadows:完整的前向阴影

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0


        struct Input  //表面函数输入结构体
        {
            float2 uv_MainTex;
        };

     
        fixed4 _Color;//创建一个与属性绑定的变量

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        //表面处理函数                    输出结构体    ---> Standard:unity的标准光照模型
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c =  _Color;
            o.Albedo = c.rgb;
           
        }
        ENDCG
    }
    FallBack "Diffuse"
}
